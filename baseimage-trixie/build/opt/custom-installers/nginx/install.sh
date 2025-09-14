#! /bin/sh

set -e
set -x

apt-get update
apt-get install -y --no-install-recommends -t trixie nginx
if invoke-rc.d --quiet nginx status >/dev/null; then
  :
else
  invoke-rc.d nginx start
fi

install -m 644 -o root -g root -p /opt/custom-installers/nginx/etc/nginx/conf.d/misc.conf /etc/nginx/conf.d/misc.conf
if etckeeper unclean 1>/dev/null 2>/dev/null; then
  etckeeper commit "nginx: add conf.d/misc.conf"
fi

# nginx_version="1.22.1-1~bullseye"
# 
# ## install gnupg
# apt-get install -y --no-install-recommends gnupg
# 
# ## install apt key
# curl -sSf http://nginx.org/keys/nginx_signing.key | \
#   gpg --no-default-keyring --keyring /usr/share/keyrings/nginx.gpg --import
# 
# ## add apt-line
# (
#   echo "deb     [signed-by=/usr/share/keyrings/nginx.gpg] http://nginx.org/packages/debian/ bullseye nginx"
#   echo "deb-src [signed-by=/usr/share/keyrings/nginx.gpg] http://nginx.org/packages/debian/ bullseye nginx"
#   echo "deb     [signed-by=/usr/share/keyrings/nginx.gpg] http://nginx.org/packages/mainline/debian/ bullseye nginx"
#   echo "deb-src [signed-by=/usr/share/keyrings/nginx.gpg] http://nginx.org/packages/mainline/debian/ bullseye nginx"
# ) | tee /etc/apt/sources.list.d/nginx.list
# 
# ## add apt-preferences
# cat <<EOS >/etc/apt/preferences.d/nginx
# Package: *
# Pin: release o=nginx, l=nginx
# Pin-Priority: 600
# EOS
# 
# ## etckeeper
# if etckeeper unclean 1>/dev/null 2>/dev/null; then
#   etckeeper commit "apt: added apt-line, apt-preferences for nginx"
# fi
# 
# ## install nginx
# apt-get update
# apt-get install -y --no-install-recommends nginx=${nginx_version}
# 
# ## configure nginx
# install -m 644 -o root -g root -p /opt/custom-installers/nginx/etc/nginx/conf.d/misc.conf /etc/nginx/conf.d/misc.conf
# if etckeeper unclean 1>/dev/null 2>/dev/null; then
#   etckeeper commit "nginx: add conf.d/misc.conf"
# fi
# 
# ## start nginx
# service nginx start
