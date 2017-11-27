#! /bin/sh

if [ -f setenv.sh ]; then
  . ./setenv.sh
else
  export SECRET_KEY_BASE=`bundle exec rake secret`
  echo "export SECRET_KEY_BASE=$SECRET_KEY_BASE" > setenv.sh
fi

exec bundle exec rails s Puma -e production -p 9292 -b 127.0.0.1

