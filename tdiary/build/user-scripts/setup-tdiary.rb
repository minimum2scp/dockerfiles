#! /bin/sh

set -e
set -x
export DEBIAN_FRONTEND=noninteractive

GHQ_ROOT=$HOME/go/src
DATA_ROOT=$HOME/tdiary

##
## git clone tdiary-xxx
##
mkdir -p $GHQ_ROOT/github.com/tdiary/
git clone https://github.com/tdiary/tdiary-core.git       $GHQ_ROOT/github.com/tdiary/tdiary-core
git clone https://github.com/tdiary/tdiary-contrib.git    $GHQ_ROOT/github.com/tdiary/tdiary-contrib
git clone https://github.com/tdiary/tdiary-style-gfm.git  $GHQ_ROOT/github.com/tdiary/tdiary-style-gfm
git clone https://github.com/tdiary/tdiary-style-rd.git   $GHQ_ROOT/github.com/tdiary/tdiary-style-rd

## add Gemfile.local
install -m 644 -p /build/$GHQ_ROOT/github.com/tdiary/tdiary-core/Gemfile.local $GHQ_ROOT/github.com/tdiary/tdiary-core/Gemfile.local

## run bundle install
cd $GHQ_ROOT/github.com/tdiary/tdiary-core
mkdir -p vendor/bundle
bundle install --path vendor/bundle


##
## tdiary data
##
mkdir -p $DATA_ROOT/data

## add .htpasswd (user=debian, password=debian)
install -m 600 -p /build/$DATA_ROOT/.htpasswd    $DATA_ROOT/.htpasswd

## add tdiary.conf, start.sh
install -m 644 -p /build/$DATA_ROOT/tdiary.conf  $DATA_ROOT/tdiary.conf
install -m 755 -p /build/$DATA_ROOT/start.sh     $DATA_ROOT/start.sh

## symlink .htpasswd, tdiary.conf into tdiary-core
cd $GHQ_ROOT/github.com/tdiary/tdiary-core
ln -s $DATA_ROOT/.htpasswd $DATA_ROOT/tdiary.conf .

