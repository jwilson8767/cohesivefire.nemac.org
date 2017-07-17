#!/usr/bin/env bash
set -ex

# Apache/httpd config
rm -rf /etc/httpd/conf.d
sed --in-place '/IncludeOptional conf.d\/\*.conf/d' /etc/httpd/conf/httpd.conf

mkdir /etc/httpd/conf-enabled
mkdir /etc/httpd/sites-enabled

echo "
IncludeOptional conf-enabled/*.conf
IncludeOptional sites-enabled/*.conf

ServerName \${PRIMARY_DOMAIN}
" >> /etc/httpd/conf/httpd.conf




# PHP config
echo "
    date.timezone = \${PHP_DATE_TIMEZONE}
    memory_limit = \${PHP_MEMORY_LIMIT}
    post_max_size = \${PHP_POST_MAX_SIZE}
    upload_max_filesize = \${PHP_UPLOAD_MAX_FILESIZE}
    max_execution_time = \${PHP_MAX_EXECUTION_TIME}
    display_errors = \${ENABLE_DEBUGGING}
    error_log = \"/var/log/php.log\"
    expose_php = Off
    html_errors = Off
    variables_order = \"EGPCS\"
    session.save_path = \"/tmp\"
    default_socket_timeout = 90
    short_open_tag = 1
    allow_url_fopen = On
       " >> /etc/php.ini

echo  "
    xdebug.enabled=\${ENABLE_DEBUGGING}
    xdebug.remote_enable=1
    xdebug.remote_host=\${XDEBUG_REMOTE_HOST}
    xdebug.remote_autostart=1
    xdebug.remote_handler=dbgp
    xdebug.remote_mode=req
    " >> /etc/php.d/xdebug.ini

