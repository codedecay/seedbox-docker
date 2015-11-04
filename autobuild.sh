#!/bin/bash

BUILD_PATH=$(dirname $0)


mkdir /data
mkdir -p /docker/config/auth

docker pull debian:jessie
docker pull alpine:3.2
docker pull emby/embyserver
docker pull pydio/pydio-core

docker build -t xataz/seedbox-ftp ${BUILD_PATH}/dockerfiles/ftp
docker build -t xataz/seedbox-rutorrent ${BUILD_PATH}/dockerfiles/rutorrent
docker build -t xataz/seedbox-transmission ${BUILD_PATH}/dockerfiles/transmission
docker build -t xataz/seedbox-sickrage ${BUILD_PATH}/dockerfiles/sickrage
docker build -t xataz/seedbox-nginx ${BUILD_PATH}/dockerfiles/nginx
docker build -t xataz/seedbox-couchpotato ${BUILD_PATH}/dockerfiles/couchpotato
