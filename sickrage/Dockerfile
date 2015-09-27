FROM debian
MAINTAINER xataz <xataz@mondedie.fr>

RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && apt-get install -y python-cheetah git && \
	mkdir -p /sickrage && cd /sickrage && git clone https://github.com/SiCKRAGETV/SickRage.git && \
	


RUN mkdir -p /data/sickrage && groupadd -g 5000 torrent && useradd --shell /bin/bash --home /data -M --group torrent torrent

VOLUME ["/data"]

ENV TORRENT_CLIENT="rutorrent"
USER torrent
EXPOSE 8081
CMD ["/usr/bin/python","/sickrage/SickBeard.py"]