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
for repo in tdiary-core \
            tdiary-contrib \
            tdiary-blogkit \
            tdiary-cache-redis \
            tdiary-cache-memcached \
            tdiary-cache-null \
            tdiary-io-mongodb \
            tdiary-io-rdb \
            tdiary-theme \
            tdiary-theme-nonfree \
            tdiary-style-emptdiary \
            tdiary-style-etdiary \
            tdiary-style-gfm \
            tdiary-style-rd \
; do
  git clone https://github.com/tdiary/${repo}.git $GHQ_ROOT/github.com/tdiary/${repo}
done

## Checkout tdiary v5.1.4 (workaround)
cd $GHQ_ROOT/github.com/tdiary/tdiary-core
git checkout v5.1.4

## run bundle install
cd $GHQ_ROOT/github.com/tdiary/tdiary-core
mkdir -p vendor/bundle
bash -l -c "bundle install --path vendor/bundle --jobs=4"

## add Gemfile.local
install -m 644 -p /tmp/build/tdiary/$GHQ_ROOT/github.com/tdiary/tdiary-core/Gemfile.local $GHQ_ROOT/github.com/tdiary/tdiary-core/Gemfile.local

## run bundle install again
bash -l -c "bundle lock --update=faraday"
bash -l -c "bundle install"
bash -l -c "bundle clean"

## show diff
GIT_PAGER= git diff Gemfile.lock

##
## tdiary data
##
mkdir -p $DATA_ROOT/data

## add .htpasswd (user=debian, password=debian)
install -m 600 -p /tmp/build/tdiary/$DATA_ROOT/.htpasswd    $DATA_ROOT/.htpasswd

## add tdiary.conf, start.sh
install -m 644 -p /tmp/build/tdiary/$DATA_ROOT/tdiary.conf  $DATA_ROOT/tdiary.conf
install -m 755 -p /tmp/build/tdiary/$DATA_ROOT/start.sh     $DATA_ROOT/start.sh

## symlink .htpasswd, tdiary.conf into tdiary-core
cd $GHQ_ROOT/github.com/tdiary/tdiary-core
ln -s $DATA_ROOT/.htpasswd $DATA_ROOT/tdiary.conf .

