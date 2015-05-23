#! /bin/bash

##
## This script installs google-fluentd, google-fluentd-catch-all-config
##
## see also:
##
##   https://cloud.google.com/logging/docs/
##   https://storage.googleapis.com/signals-agents/logging/google-fluentd-install.sh
##

set -x
set -e

etckeeper_commit (){
  if dpkg-query -W etckeeper 1>/dev/null 2>/dev/null; then
    etckeeper commit "$1" 1>/dev/null 2>/dev/null
  fi
}

REPO_HOST=repo.stackdriver.com
APP_HOST=app.stackdriver.com

##
## add apt-line, GPG key, and apt-get update
##
debian_release=`cat /etc/debian_version`
case ${debian_release} in
  8.*|stretch/sid)
    curl -s -S -f -o /etc/apt/sources.list.d/stackdriver.list "https://${REPO_HOST}/jessie.list"
    ;;
  7.*)
    curl -s -S -f -o /etc/apt/sources.list.d/stackdriver.list "https://${REPO_HOST}/wheezy.list"
    ;;
esac
curl -s -f https://${APP_HOST}/RPM-GPG-KEY-stackdriver | apt-key add -
etckeeper_commit "apt: add google-fluentd repository and GPG key"
apt-get -qq update

##
## install packages
##
apt-get install --no-install-recommends -y google-fluentd google-fluentd-catch-all-config

##
## configure
##
tmp_conf=`mktemp`
cat <<CONF > $tmp_conf
# Master configuration file for google-fluentd

# Include any configuration files in the config.d directory.
#
# An example "catch-all" configuration can be found at
# https://github.com/GoogleCloudPlatform/fluentd-catch-all-config
@include config.d/*.conf

# Do not collect fluentd's own logs to avoid infinite loops.
<match fluent.**>
  type null
</match>

# Configure all sources to output to Google Cloud Logging
<match **>
  type google_cloud
  # Set the chunk limit conservatively to avoid exceeding the limit
  # of 2MB per write request.
  buffer_chunk_limit 512K
  flush_interval 5s
  # Never wait longer than 5 minutes between retries.
  max_retry_wait 300
  # Disable the limit on the number of retries (retry forever).
  disable_retry_limit

  # Uncomment the following lines to use service account authentication for
  # the logging agent.
  # See the documentation at https://cloud.google.com/logging/docs
  #
  # After obtaining and installing your private key file, uncomment the
  # following lines and set 'private_key_email' to the service account address.
  #
  # auth_method xxx
  # private_key_email xxx
  # private_key_path xxx
  # private_key_passphrase xxx
  # use_metadata_service xxx
  # project_id xxx
  # zone xxx
  # vm_id xxx
</match>
CONF

set_param (){
  local param=$1
  local var=$2
  if [ -n "${var}" ]; then
     sed -i -e 's@# ${param} xxx@${param} ${var}@' ${tmp_conf}
  fi
}

if [ -n "${GOOGLE_FLUENTD_PRIVATE_KEY_CONTENT_BASE64}" ]; then
  t1=`mktemp`
  t2=`mktemp`
  echo "${GOOGLE_FLUENTD_PRIVATE_KEY_CONTENT_BASE64}" > ${t1}
  base64 -d ${t1} > ${t2}
  if [ -z "${GOOGLE_FLUENTD_PRIVATE_KEY_PATH}" ]; then
    GOOGLE_FLUENTD_PRIVATE_KEY_PATH=/etc/google-fluentd/${GOOGLE_FLUENTD_PROJECT_ID:-default}.p12
  fi
  install -m 600 -o root -g  root -p ${t2} ${GOOGLE_FLUENTD_PRIVATE_KEY_PATH}
  rm ${t1} ${t2}
fi

if [ "${GOOGLE_FLUENTD_USE_METADATA_SERVICE}" = false ]; then
  if [ -z "${GOOGLE_FLUENTD_VM_ID}" ]; then
    GOOGLE_FLUENTD_VM_ID=`hostname`
  fi
fi

set_param auth_method             ${GOOGLE_FLUENTD_AUTH_METHOD}
set_param private_key_email       ${GOOGLE_FLUENTD_PRIVATE_KEY_EMAIL}
set_param private_key_path        ${GOOGLE_FLUENTD_PRIVATE_KEY_PATH}
set_param private_key_passphrase  ${GOOGLE_FLUENTD_PRIVATE_KEY_PASSPHRASE}

if [ "${GOOGLE_FLUENTD_USE_METADATA_SERVICE}" = false ]; then
  set_param use_metadata_service    ${GOOGLE_FLUENTD_USE_METADATA_SERVICE}
  set_param project_id              ${GOOGLE_FLUENTD_PROJECT_ID}
  set_param zone                    ${GOOGLE_FLUENTD_ZONE}
  set_param vm_id                   ${GOOGLE_FLUENTD_VM_ID}
fi


install -m 644 -o root -g root -p ${tmp_conf} /etc/google-fluentd/google-fluentd.conf
etckeeper_commit "configured google-fluentd.conf with env vars"
rm ${tmp_conf}

## restart google-fluentd
service google-fluentd restart

