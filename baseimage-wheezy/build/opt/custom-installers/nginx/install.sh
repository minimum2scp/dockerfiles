#! /bin/sh

set -e
set -x

## install nginx (from wheezy-backports)
apt-get install -y --no-install-recommends nginx-light -t wheezy-backports

## configure nginx
install -m 644 -o root -g root -p /opt/custom-installers/nginx/etc/nginx/conf.d/misc.conf /etc/nginx/conf.d/misc.conf
if dpkg-query -s openssh-server 1>/dev/null 2>/dev/null; then
  etckeeper commit "nginx: add conf.d/misc.conf"
fi

