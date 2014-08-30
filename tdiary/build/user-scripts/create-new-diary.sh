#! /bin/sh

set -e
set -x

cd /home/debian
tdiary new --skip-bundle diary

cd /home/debian/diary
cp -a tdiary.conf tdiary.conf.orig

cat <<EOS > Gemfile.local
gem 'tdiary'
gem 'tdiary-contrib'
gem 'tdiary-style-gfm'
EOS

mkdir -p vendor/bundle
bundle install --path vendor/bundle --without development test

(echo "debian"; echo "debian"; echo "debian" ) | bundle exec tdiary htpasswd

