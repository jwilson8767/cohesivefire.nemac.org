#!/usr/bin/env bash
#
# This script is run when the container is first started.
#
export COMPOSER_ALLOW_SUPERUSER=1
composer global require hirak/prestissimo

chown -R apache:apache /opt/.composer

#run composer install
su -s "/bin/bash" -c "cd /app/ && composer install" apache

mkdir -p /app/web/sites/default
chmod 660 /app/web/sites/default/settings.php 2> /dev/null
echo "<?php require(dirname(\$app_root) . '/settings.php');" > /app/web/sites/default/settings.php