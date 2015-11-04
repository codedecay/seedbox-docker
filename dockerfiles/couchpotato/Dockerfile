FROM alpine:3.2 
MAINTAINER xataz <xataz@mondedie.fr>

RUN addgroup -g 5000 torrent && adduser -h /home/torrent -s /bin/sh -D -G torrent -u 5000 torrent && \
	apk add --update python git && \
	cd / && git clone https://github.com/sarakha63/persomov.git && chown -R torrent:torrent /persomov && \
	apk del git && rm -rf /var/cache/apk/*

VOLUME [ "/config", "/blackhole", "/torrents"]

ENV TORRENT_METHOD="rtorrent"

ADD start.sh /usr/bin/start.sh
ADD settings.conf /tmp/settings.conf

RUN chmod +x /usr/bin/start.sh

EXPOSE 5050
CMD ["/usr/bin/start.sh"]
