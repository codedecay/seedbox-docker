FROM debian
MAINTAINER xataz <xataz@mondedie.fr>

RUN groupadd -g 5000 torrent && useradd --shell /bin/bash -m --groups torrent --uid 5000 torrent

RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && apt-get upgrade -y && apt-get install -y automake libcppunit-dev libtool build-essential pkg-config \
	vim nano subversion curl git unzip unrar rar zip \
	libssl-dev libcurl4-openssl-dev libsigc++-2.0-dev libncurses5-dev
	
RUN cd /tmp && svn checkout http://svn.code.sf.net/p/xmlrpc-c/code/advanced xmlrpc-c && cd xmlrpc-c/ && \
	./configure && make && make install && \
	cd /tmp && git clone https://github.com/rakshasa/libtorrent.git && cd libtorrent && git checkout 0.13.6 && \
	./autogen.sh && ./configure && make && make install && \
	cd /tmp && git clone https://github.com/rakshasa/rtorrent.git && cd rtorrent && git checkout 0.9.6 && \
	./autogen.sh && ./configure --with-xmlrpc-c && make && make install && \
	ldconfig

VOLUME ["/data"]

EXPOSE 5000

ENV DOWNLOAD_LIMIT=0 UPLOAD_LIMIT=0

ADD rtorrentrc /home/torrent/.rtorrent.rc
ADD start.sh /usr/bin/start.sh
RUN chown torrent:torrent /home/torrent/.rtorrent.rc && chmod +x /usr/bin/start.sh

CMD ["/usr/bin/start.sh"]