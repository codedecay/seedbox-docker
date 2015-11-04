FROM alpine:3.2
MAINTAINER xataz <xataz@mondedie.fr>

COPY fs /
VOLUME /sites /data
EXPOSE 80
CMD ["/usr/bin/start.sh"]

ENV JRE=jre1.8.0_60 \
    JAVA_HOME=/opt/jre

RUN addgroup -g 5000 torrent && adduser -h /home/torrent -s /bin/sh -D -G torrent -u 5000 torrent && \
	echo "http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk add --update subversion wget ffmpeg ca-certificates rtorrent nginx php-fpm php-json curl gzip zip unrar supervisor git geoip && \
    	cd /tmp && \
    	wget "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" \
		"https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk" && \
    	apk add --allow-untrusted glibc-2.21-r2.apk glibc-bin-2.21-r2.apk && \
    	/usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    	echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    	mkdir /opt && \
    	wget http://www.java.net/download/jdk8u60/archive/b18/binaries/jre-8u60-ea-bin-b18-linux-x64-02_jun_2015.tar.gz -O /tmp/${JRE}.tgz && \
    	cd /opt && tar zxvf /tmp/${JRE}.tgz && \
    	ln -s /opt/${JRE} /opt/jre && \
    	ln -s /opt/jre/bin/java /usr/bin/java && \
    	mkdir -p /var/www && cd /var/www && git clone https://github.com/Novik/ruTorrent.git rutorrent && \
        cd /var/www/rutorrent/plugins/ && svn co http://rutorrent-logoff.googlecode.com/svn/trunk logoff && \
        cd /var/www/rutorrent/plugins/ && git clone https://github.com/xombiemp/rutorrentMobile.git mobile && \
        cd /var/www/rutorrent/plugins/ && svn checkout http://rutorrent-pausewebui.googlecode.com/svn/trunk pausewebui && \
        chown -R torrent:torrent /var/www/rutorrent && mv /var/www/rutorrent /var/www/torrent && \
	apk del wget ca-certificates git subversion && \
    	cd /opt/jre/lib/amd64 && rm libjavafx_* libjfx* libfx* && \
    	cd /opt/jre/lib/ && rm -rf ext/jfxrt.jar jfxswt.jar javafx.properties font* && \
    	rm /tmp/* /var/cache/apk/* && rm -rf /var/www/torrent/plugins/mediainfo

