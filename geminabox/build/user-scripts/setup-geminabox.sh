#! /bin/sh

set -e
set -x
export DEBIAN_FRONTEND=noninteractive

GEMINABOX_ROOT=/home/debian/geminabox
mkdir ${GEMINABOX_ROOT}

## put Gemfile, config.ru, start.sh
install -m 644 -o debian -g debian -p /tmp/build/geminabox/${GEMINABOX_ROOT}/Gemfile   ${GEMINABOX_ROOT}
install -m 644 -o debian -g debian -p /tmp/build/geminabox/${GEMINABOX_ROOT}/config.ru ${GEMINABOX_ROOT}
install -m 755 -o debian -g debian -p /tmp/build/geminabox/${GEMINABOX_ROOT}/start.sh  ${GEMINABOX_ROOT}

## run bundle install: install geminabox, puma
cd ${GEMINABOX_ROOT}
mkdir -p vendor/bundle
bundle install --path vendor/bundle

## create data dir, tmp dir
mkdir -p ${GEMINABOX_ROOT}/data ${GEMINABOX_ROOT}/tmp

