FROM alpine:3.2 
MAINTAINER xataz <xataz@mondedie.fr>

RUN addgroup -g 5000 torrent && adduser -h /home/torrent -s /bin/sh -D -G torrent -u 5000 torrent && \
	apk add --update python py-pip git && pip install cheetah && \
	cd / && git clone https://github.com/SiCKRAGETV/SickRage.git && chown -R torrent:torrent /SickRage && \
	apk del py-pip 

VOLUME [ "/config", "/blackhole", "/torrents"]

ENV TORRENT_METHOD="rtorrent"

ADD start.sh /usr/bin/start.sh
ADD config.ini /tmp/config.ini

EXPOSE 8081
CMD ["/usr/bin/start.sh"]
