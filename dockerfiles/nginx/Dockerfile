FROM alpine:3.2
MAINTAINER ixataz <xataz@mondedie.fr>

RUN adduser -h /home/torrent -s /bin/sh -D -G www-data -u 5000 www-data && \
    apk --update add openssl-dev pcre-dev zlib-dev wget build-base php-fpm supervisor && \
    cd /tmp && \
    wget http://nginx.org/download/nginx-1.9.6.tar.gz && \
    tar -zxvf nginx-1.9.6.tar.gz && \
    cd /tmp/nginx-1.9.6 && \
    ./configure \
        --with-http_ssl_module \
	--with-http_v2_module \
        --with-http_gzip_static_module \
        --prefix=/etc/nginx \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --sbin-path=/usr/local/sbin/nginx && \
    make && \
    make install && \
    apk del build-base openssl-dev pcre-dev zlib-dev wget && \
    apk add openssl pcre zlib && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*
RUN mkdir /etc/nginx/ssl

RUN openssl dhparam -out dhparams.pem 2048 && \
openssl req $@ -new -x509 -days 3658 -nodes -newkey rsa:2048 -subj "/C=US/ST=Californie/L=Springfield/O=wtf/CN=wtf" -out /etc/nginx/ssl/server.crt -keyout /etc/nginx/ssl/server.key

COPY fs /
VOLUME /sites /sites.d /auth

ENTRYPOINT ["/usr/bin/manage.sh"]
CMD ["start"]

RUN chmod +x /usr/bin/manage.sh
