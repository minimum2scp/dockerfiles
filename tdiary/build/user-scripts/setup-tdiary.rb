#! /bin/sh

set -e
set -x
export DEBIAN_FRONTEND=noninteractive

##
## git clone tdiary-xxx into /home/debian/tdiary/tdiary-xxx
##
mkdir -p $HOME/tdiary/data
git clone https://github.com/tdiary/tdiary-core.git       $HOME/tdiary/tdiary-core
git clone https://github.com/tdiary/tdiary-contrib.git    $HOME/tdiary/tdiary-contrib
git clone https://github.com/tdiary/tdiary-style-gfm.git  $HOME/tdiary/tdiary-style-gfm
git clone https://github.com/tdiary/tdiary-style-rd.git   $HOME/tdiary/tdiary-style-rd

##
## add Gemfile.local
##
install -m 644 -p /build/home/debian/tdiary/tdiary-core/Gemfile.local /home/debian/tdiary/tdiary-core/Gemfile.local

##
## run bundle install
##
mkdir -p $HOME/tdiary/tdiary-core/vendor/bundle
cd $HOME/tdiary/tdiary-core
bundle install --path vendor/bundle --without test development

##
## add .htpasswd (user: debian, password: debian)
##
install -m 600 -p /build/home/debian/tdiary/tdiary-core/.htpasswd /home/debian/tdiary/tdiary-core/.htpasswd

##
## create tdiary.conf
##
install -m 644 -p /build/home/debian/tdiary/tdiary-core/tdiary.conf /home/debian/tdiary/tdiary-core/tdiary.conf
install -m 755 -p /build/home/debian/tdiary/tdiary-core/start.sh    /home/debian/tdiary/tdiary-core/start.sh


