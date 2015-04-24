#! /bin/bash -l

export HOME=/home/debian
export LANG=ja_JP.UTF-8

cd $HOME/hubot
nvm exec 0.10.36 ./bin/hubot -a slack -n hubot
