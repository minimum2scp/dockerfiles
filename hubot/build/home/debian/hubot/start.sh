#! /bin/bash -l

export HOME=/home/debian
export LANG=ja_JP.UTF-8

cd $HOME/hubot
./bin/hubot -a slack -n hubot
