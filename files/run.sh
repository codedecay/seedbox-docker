#!/bin/sh

[ -f /run-pre.sh ] && /run-pre.sh
mkdir -p /DATA/logs/php-fpm
mkdir -p /DATA/logs/nginx
mkdir -p /tmp/nginx
chown nginx /tmp/nginx
php-fpm
nginx