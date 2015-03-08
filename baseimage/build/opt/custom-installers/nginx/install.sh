#! /bin/sh

set -e
set -x

## install nginx
apt-get install -y --no-install-recommends nginx-light

## configure nginx
install -m 644 -o root -g root -p /opt/custom-installers/nginx/etc/nginx/conf.d/misc.conf /etc/nginx/conf.d/misc.conf
if dpkg-query -s openssh-server 1>/dev/null 2>/dev/null; then
  etckeeper commit "nginx: add conf.d/misc.conf"
fi

