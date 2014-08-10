#! /bin/sh

export HOME=/home/debian
export LANG=ja_JP.UTF-8

env | sort
echo ""
bundle exec gem env
echo ""

bundle exec tdiary server

