FROM debian
MAINTAINER xataz <xataz@mondedie.fr>

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y python-cheetah git 
RUN cd / && git clone https://github.com/SiCKRAGETV/SickRage.git
RUN groupadd -g 5000 torrent && useradd --shell /bin/bash --home /data -M --gid 5000 --uid 5000 torrent && chown -R torrent:torrent /SickRage

VOLUME [ "/config", "/blackhole", "/torrent"]

ENV TORRENT_METHOD="rtorrent"
ENV TORRENT_HOST="scgi://torrent:5000"
ENV TORRENT_DIR="0|/torrent"

ADD start.sh /usr/bin/start.sh
ADD config.ini /tmp/config.ini

RUN chmod +x /usr/bin/start.sh

EXPOSE 8081
CMD ["/usr/bin/start.sh"]
