#! /bin/sh

set -e
set -x

version="19.03.5"

cd /tmp

## download tarball
curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${version}.tgz || \
curl -fsSLO https://download.docker.com/linux/static/edge/x86_64/docker-${version}.tgz

## extract docker (cli) from tarball
tar -x -f /tmp/docker-${version}.tgz --strip-components=1 docker/docker

## install docker (cli)
install -m 755 -o root -g root -p /tmp/docker /usr/local/bin/docker

## cleanup
rm -f /tmp/docker-${version}.tgz /tmp/docker
