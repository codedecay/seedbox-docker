#!/bin/sh

[ -f /run-pre.sh ] && /run-pre.sh
php-fpm
nginx