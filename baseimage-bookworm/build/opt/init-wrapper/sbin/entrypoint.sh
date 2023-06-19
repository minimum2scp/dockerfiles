#! /bin/sh

run-parts --exit-on-error /opt/init-wrapper/pre-init.d
exec "$@"
