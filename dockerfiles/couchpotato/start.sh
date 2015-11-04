#!/bin/sh

if [ ! -f /config/config.ini ]
then
	mv /tmp/config.ini /config/config.ini
	if [ ${TORRENT_METHOD} == "rtorrent" ]
	then
		sed -i "s/<method>/rtorrent/;s/<host>/scgi:\/\/torrent:5000/" /config/config.ini
	elif [ ${TORRENT_METHOD} == "rtorrent" ]
	then
		sed -i "s/<method>/transmission/;s/<host>/http:\/\/torrent/:9091\/torrent\/rpc/" /config/config.ini
	else 
		sed -i "s/<method>/blackhole/" /config/config.ini
	fi
fi

chown -R torrent:torrent /persomov
chown -R torrent:torrent /config
chown -R torrent:torrent /blackhole
chown -R torrent:torrent /torrents

su - torrent -c "/usr/bin/python /persomov/CouchPotato.py --data_dir /config --config_file /config/settings.conf"
