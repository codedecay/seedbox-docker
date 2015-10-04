#!/bin/bash

if [ ! -f /config/config.ini ]
then
	mv /tmp/config.ini /config/config.ini
	sed -i "s/<method>/"${TORRENT_METHOD}"/g;s/<host>/"${TORRENT_HOST}"/g;s/<dir>/"${TORRENT_DIR}"/g" /config/config.ini
fi

chown -R torrent:torrent /SickRage
chown -R torrent:torrent /config
chown -R torrent:torrent /blackhole
chown -R torrent:torrent /torrents

su - torrent -c "/usr/bin/python /SickRage/SickBeard.py --datadir=/config"
