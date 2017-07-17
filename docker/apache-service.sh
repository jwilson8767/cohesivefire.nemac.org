#!/usr/bin/env bash

source /etc/httpd/envvars

exec httpd -D FOREGROUND