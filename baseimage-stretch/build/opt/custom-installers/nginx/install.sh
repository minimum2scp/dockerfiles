#! /bin/sh

set -e
set -x

nginx_version="1.19.7-1~stretch"

## install gnupg
apt-get install -y --no-install-recommends gnupg

## install apt key
curl -sSf http://nginx.org/keys/nginx_signing.key | apt-key --keyring /etc/apt/trusted.gpg.d/nginx.gpg add -

## add apt-line
(
  echo "deb     http://nginx.org/packages/debian/ stretch nginx"
  echo "deb-src http://nginx.org/packages/debian/ stretch nginx"
  echo "deb     http://nginx.org/packages/mainline/debian/ stretch nginx"
  echo "deb-src http://nginx.org/packages/mainline/debian/ stretch nginx"
) | tee /etc/apt/sources.list.d/nginx.list

## add apt-preferences
cat <<EOS >/etc/apt/preferences.d/nginx
Package: *
Pin: release o=nginx, l=nginx
Pin-Priority: 600
EOS

## etckeeper
if etckeeper unclean 1>/dev/null 2>/dev/null; then
  etckeeper commit "apt: added apt-key, apt-line, apt-preferences for nginx"
fi

## install nginx
apt-get update
apt-get install -y --no-install-recommends nginx=${nginx_version}

## configure nginx
install -m 644 -o root -g root -p /opt/custom-installers/nginx/etc/nginx/conf.d/misc.conf /etc/nginx/conf.d/misc.conf
if etckeeper unclean 1>/dev/null 2>/dev/null; then
  etckeeper commit "nginx: add conf.d/misc.conf"
fi

## start nginx
service nginx start
