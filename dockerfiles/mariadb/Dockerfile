FROM alpine:3.2
MAINTAINER xataz <xataz@mondedie.fr>

ADD setup.sql /tmp/setup.sql
ADD setup.sh /tmp/setup.sh

RUN apk add --update mariadb mariadb-client && \
	mkdir /var/lib/mysql && chown mysql:mysql /var/lib/mysql && \
	mysql_install_db --user=mysql --rpm && chmod +x /tmp/setup.sh && /tmp/setup.sh && \
	apk del mariadb-client && rm -rf /tmp/* && rm -rf /var/cache/apk/*

EXPOSE 3306
CMD ["/usr/bin/mysqld_safe"]
