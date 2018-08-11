#! /bin/sh

set -e
set -x

nginx_version="1.15.2-1~jessie"

## install gnupg
apt-get install -y --no-install-recommends gnupg

## install apt key
curl -sSf http://nginx.org/keys/nginx_signing.key | apt-key --keyring /etc/apt/trusted.gpg.d/nginx.gpg add -

## add apt-line
(
  echo "deb     http://nginx.org/packages/debian/ jessie nginx"
  echo "deb-src http://nginx.org/packages/debian/ jessie nginx"
  echo "deb     http://nginx.org/packages/mainline/debian/ jessie nginx"
  echo "deb-src http://nginx.org/packages/mainline/debian/ jessie nginx"
) | tee /etc/apt/sources.list.d/nginx.list

## etckeeper
if etckeeper unclean 1>/dev/null 2>/dev/null; then
  etckeeper commit "apt: added apt-key and apt-line for nginx"
fi

## install nginx
apt-get update
apt-get install -y --no-install-recommends nginx=${nginx_version}

## configure nginx
install -m 644 -o root -g root -p /opt/custom-installers/nginx/etc/nginx/conf.d/misc.conf /etc/nginx/conf.d/misc.conf
if etckeeper unclean 1>/dev/null 2>/dev/null; then
  etckeeper commit "nginx: add conf.d/misc.conf"
fi

