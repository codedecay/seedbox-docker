FROM alpine:latest
MAINTAINER Bastien Schwartz <bschwartz@lemark.xyz>

RUN apk add --update bash nginx ca-certificates \
    php-fpm php-json php-zlib php-xml \
    php-gd php-iconv php-mcrypt \
	  unzip

# fix php-fpm "Error relocating /usr/bin/php-fpm: __flt_rounds: symbol not found" bug
RUN apk add -u musl
RUN rm -rf /var/cache/apk/*
ADD https://github.com/SSilence/selfoss/releases/download/2.14/selfoss-2.14.zip /tmp/
RUN unzip /tmp/selfoss-*.zip -d /var/www/html && \
    rm /tmp/selfoss-*.zip && \
    ln -s /var/www/html/data/config.ini /var/www/html && \
    chown -R nginx:www-data /var/www/html
ADD files/nginx.conf /etc/nginx/
ADD files/php-fpm.conf /etc/php/
ADD files/run.sh /
RUN chmod +x /run.sh


EXPOSE 80
VOLUME /var/www/html/data

CMD ["/run.sh"]
