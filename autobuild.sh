#!/bin/bash

BUILD_PATH=$(dirname $0)

docker build -t xataz/seedbox-rutorrent ${BUILD_PATH}/dockerfiles/rutorrent
docker build -t xataz/seedbox-transmission ${BUILD_PATH}/dockerfiles/transmission
docker build -t xataz/seedbox-sickrage ${BUILD_PATH}/dockerfiles/sickrage
