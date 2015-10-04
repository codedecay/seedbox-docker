FROM debian
MAINTAINER xataz <xataz@mondedie.fr>

ADD http://nginx.org/keys/nginx_signing.key /tmp/nginx.key
ADD http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2015.6.1_all.deb /tmp/multimedia.deb

RUN echo "deb http://nginx.org/packages/mainline/debian jessie nginx" >> /etc/apt/sources.list.d/nginx.list && \
        echo "deb-src http://nginx.org/packages/mainline/debian jessie nginx" >> /etc/apt/sources.list.d/nginx.list && \
        echo "deb http://ftp2.fr.debian.org/debian jessie main non-free" >> /etc/apt/sources.list.d/non-free.list && \
        echo "deb-src http://ftp2.fr.debian.org/debian jessie main non-free" >> /etc/apt/sources.list.d/non-free.list && \
        echo "deb http://www.deb-multimedia.org jessie main non-free" >> /etc/apt/sources.list.d/multimedia.list

RUN apt-key add /tmp/nginx.key && rm -rf /tmp/nginx.key && dpkg -i /tmp/multimedia.deb && rm -rf /tmp/multimedia.deb && \
        export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get upgrade -y && \
        apt-get install -y libssl-dev libcurl4-openssl-dev libncurses5-dev nginx subversion supervisor \
        apache2-utils curl php5 php5-cli php5-fpm php5-curl php5-geoip git unzip unrar rar zip ffmpeg buildtorrent mediainfo

RUN mkdir /var/www && cd /var/www && git clone https://github.com/Novik/ruTorrent.git rutorrent && \
        cd /var/www/rutorrent/plugins/ && svn co http://rutorrent-chat.googlecode.com/svn/trunk chat && \
        cd /var/www/rutorrent/plugins/ && svn co http://rutorrent-logoff.googlecode.com/svn/trunk logoff && \
        cd /var/www/rutorrent/plugins/ && git clone https://github.com/xombiemp/rutorrentMobile.git mobile && \
        cd /var/www/rutorrent/plugins/ && svn checkout http://rutorrent-pausewebui.googlecode.com/svn/trunk pausewebui && \
        cd /var/www/rutorrent/plugins/ && svn checkout http://svn.rutorrent.org/svn/filemanager/trunk/filemanager && \
        chown -R www-data:www-data /var/www/rutorrent

COPY fs /
RUN chown -R www-data:www-data /var/www


EXPOSE 80

#ADD start.sh /usr/bin/start.sh
#RUN chmod +x /usr/bin/start.sh

CMD ["/usr/bin/supervisor"]
