#! /bin/sh
bundle exec puma -b tcp://127.0.0.1:9292 --pidfile tmp/puma.pid -S tmp/puma.state
