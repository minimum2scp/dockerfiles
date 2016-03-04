#! /bin/bash

set -e
set -x

## install unzip, dnsutils (dig)
pkg=()
if dpkg-query -W unzip 1>/dev/null 2>/dev/null; then
  :
else
  pkg+=(unzip)
fi
if dpkg-query -W dnsutils 1>/dev/null 2>/dev/null; then
  :
else
  pkg+=(dnsutils)
fi
if [ "${#pkg[@]}" -gt 0 ]; then
  apt-get install -y --no-install-recommends "${pkg[@]}"
fi

## install consul to /usr/local/bin/consul
if [ ! -x /usr/local/bin/consul ]; then
  tmpdir=`mktemp -d`
  cd $tmpdir

  curl -LO https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip
  unzip -x 0.5.2_linux_amd64.zip
  install -m 755 -o root -g root -p consul /usr/local/bin/consul
  rm consul 0.5.2_linux_amd64.zip

  cd /
  rmdir $tmpdir
fi

## install consul web ui to /var/lib/consul-ui
## TODO: split out
if [ ! -f /var/lib/consul-ui/index.html ]; then
  tmpdir=`mktemp -d`
  cd $tmpdir

  curl -LO https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip
  unzip -x 0.5.2_web_ui.zip
  mkdir -p /var/lib/consul-ui
  mv dist/* /var/lib/consul-ui
  rm dist/.gitkeep
  rmdir dist
  rm 0.5.2_web_ui.zip

  cd /
  rmdir $tmpdir
fi

## create config dir
mkdir /etc/consul.d

## create user
addgroup --system consul
adduser --system \
  --disabled-password \
  --quiet \
  --gecos "consul user" \
  --shell /bin/false \
  --ingroup consul \
  --home /var/lib/consul \
  consul

## install supervisor
/opt/custom-installers/supervisor/install.sh

## supervisor config
tmpfile=`mktemp`
cat <<EOS >$tmpfile
[program:consul]
command = /usr/local/bin/consul agent -server -bootstrap -data-dir=/var/lib/consul -dc=local -config-dir=/etc/consul.d
numprocs = 1
directory = /var/lib/consul
umask = 022
autostart = false
autorestart = true
startsecs = 3
startretries = 5
user = consul
stdout_logfile = /var/log/supervisor/consul.log
stderr_logfile = /var/log/supervisor/consul.log
redirect_stderr = true
;stopasgroup = true
;killasgroup = true

[program:consul-ui]
command = /usr/local/bin/consul agent -server -bootstrap -data-dir=/var/lib/consul -dc=local -config-dir=/etc/consul.d -ui-dir=/var/lib/consul-ui -client=0.0.0.0
numprocs = 1
directory = /var/lib/consul
umask = 022
autostart = false
autorestart = true
startsecs = 3
startretries = 5
user = consul
stdout_logfile = /var/log/supervisor/consul-ui.log
stderr_logfile = /var/log/supervisor/consul-ui.log
redirect_stderr = true
;stopasgroup = true
;killasgroup = true
EOS
install -m 644 -o root -g root -p $tmpfile /etc/supervisor/conf.d/consul.conf
rm $tmpfile

if [ -S /var/run/supervisor.sock -o -S /run/supervisor.sock ]; then
  supervisorctl update
fi

