#! /bin/sh

set -e
set -x

nodenv_root=/opt/nodenv
nodejs_version=$1

## install nodenv and plugins into /opt/nodenv
if [ ! -d /opt/nodenv ]; then
  git clone https://github.com/nodenv/nodenv.git                   ${nodenv_root}
  git clone https://github.com/nodenv/node-build.git               ${nodenv_root}/plugins/node-build
  git clone https://github.com/charlesbjohnson/nodenv-update.git   ${nodenv_root}/plugins/nodenv-update
fi

## install /etc/profile.d/nodenv.sh
if [ ! -f /etc/profile.d/nodenv.sh ]; then
  cat <<PROFILE > /etc/profile.d/nodenv.sh
export NODENV_ROOT=${nodenv_root}
export PATH=\${NODENV_ROOT}/bin:\${PATH}
eval "\$(nodenv init -)"
PROFILE

  if etckeeper unclean 1>/dev/null 2>/dev/null; then
    etckeeper commit "add /etc/profile.d/nodenv.sh to use ${nodenv_root}"
  fi
fi

## create shims,versions
set +e
bash -l -c "nodenv rehash"
set -e

## install nodejs with nodenv
if [ -n "${nodejs_version}" ]; then
  bash -l -c "nodenv install -s ${nodejs_version}"
  bash -l -c "nodenv global ${nodejs_version}"
fi

