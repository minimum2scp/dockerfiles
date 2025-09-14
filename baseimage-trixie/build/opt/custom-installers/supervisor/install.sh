#! /bin/sh

set -e
set -x

## install supervisor
apt-get install -y --no-install-recommends supervisor

## configure supervisor
install -m 644 -o root -g root -p /opt/custom-installers/supervisor/etc/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
if dpkg-query -s openssh-server 1>/dev/null 2>/dev/null; then
  etckeeper commit "supervisor: set socket as root:adm 770, and enabled inet_http_server with 0.0.0.0:9001"
fi

