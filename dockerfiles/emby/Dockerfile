FROM alpine:3.2
MAINTAINER xataz <xataz@mondedie.fr>

RUN echo "http://dl-3.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
	apk add --update emby

VOLUME /data

CMD ["emby-server"]
