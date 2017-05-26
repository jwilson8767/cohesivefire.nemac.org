#!/usr/bin/env bash
#
# This script is run when the container is first started.
#
set -x
set +e

#run composer install
su -s "/bin/bash" -c "cd /app/ && composer install" www-data
