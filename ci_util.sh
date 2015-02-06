#! /bin/bash

set -e
set -x

show_usage (){
  echo "${0##*/} [-c ~/.cache/docker/minimum2scp/fooimage.tar] <subcommand> image_name"
  echo "subcommand may be:    pull, build"
}

cache=

while getopts c: opt; do
  case $opt in
    c)
      cache=$OPTARG
      ;;
    *)
      show_usage
      exit 1
      ;;
  esac
done

shift `expr $OPTIND - 1`

action=$1
image=$2
if [ -z "${cache}" ]; then
  cache=$HOME/.cache/docker/${image%:*}.tar
fi

if [ ! -d "${cache%/*}" ]; then
  mkdir -p "${cache%/*}"
fi

case "${action}" in
  pull)
    if [ -r "${cache}" ]; then
      docker load -i ${cache}
    else
      docker pull ${image}
      docker save ${image} > ${cache}
    fi
    ;;
  build)
    if [ -r "${cache}" ]; then
      docker load -i ${cache}
    else
      dir=${image%:*}
      dir=${dir#*/}
      cd $dir
      docker build -t ${image} .
      docker save ${image} > ${cache}
      cd -
    fi
    ;;
  *)
    show_usage
    exit 1
    ;;
esac

