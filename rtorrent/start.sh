#!/bin/bash

mkdir -p /data/{torrents,watch,.session}
chown -R torrent:torrent /data

su - torrent -c "rtorrent -o download_rate=${DOWNLOAD_LIMIT},upload_rate=${UPLOAD_LIMIT}"