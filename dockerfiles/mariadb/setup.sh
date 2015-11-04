#!/bin/sh

mysqld_safe &
sleep 5
mysqladmin -u root password 'root'
mysql -uroot -proot < /tmp/setup.sql
