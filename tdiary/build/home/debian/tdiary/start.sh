#! /bin/bash -l

export HOME=/home/debian
export LANG=ja_JP.UTF-8

cd $HOME/go/src/github.com/tdiary/tdiary-core

env | sort
echo ""
bundle exec gem env
echo ""

exec bundle exec rackup -o 0.0.0.0 -p 19292

