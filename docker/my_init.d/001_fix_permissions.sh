#!/usr/bin/env bash
#
# This script is run when the container is first started.
#
set -x

# Fixes most shared folder permission issues.
if [[ `stat -c "%u" /app` != 0 ]]; then
  # By changing apache's uid we avoid having to chown all files /app
  usermod --non-unique --uid `stat -c "%u" /app` -gid `stat -c "%g" /app`  apache
else
  # Root owns the folder, best to just chown.
  chown apache:apache /app -R
fi;

# Apache fails to start if the log directory doesn't exist.
mkdir -p /var/log/apache2
chown apache:apache /var/log/httpd
