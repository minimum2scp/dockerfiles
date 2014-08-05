#! /bin/sh

##
## This scripts creates "minimum2scp/debian:latest" image.
## (almost equivalent to "debian:sid" image)
##

tmpdir=${TMPDIR-/tmp}
tag_option=${TAG+-t ${TAG}}

if [ ! -d ${tmpdir}/docker ]; then
  git clone git@github.com:docker/docker.git $tmpdir/docker
fi

debootstrap_options="--arch=amd64 --variant=minbase --include=iproute2,inetutils-ping"
debootstrap_options="$debootstrap_options sid http://ftp.jp.debian.org/debian"

sudo TMPDIR=${tmpdir} ${tmpdir}/docker/contrib/mkimage.sh ${tag_option} debootstrap ${debootstrap_options}

