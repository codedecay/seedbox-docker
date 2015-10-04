#!/bin/bash

mkdir -p /data/{torrents,watch,.session,tv,movies,music}
chown -R torrent:torrent /data

/usr/bin/supervisord
