FROM debian:jessie
MAINTAINER xataz <xataz@mondedie.fr>

RUN apt-get update && apt-get install --no-install-recommends -y openssl libpam-pwdfile vsftpd && \
	mkdir /var/ftp && useradd --home /home --gid nogroup -u 5000 -m --shell /bin/false vsftpd 



RUN openssl dhparam -out dhparams.pem 2048 && \
	openssl req $@ -new -x509 -days 3658 -nodes -newkey rsa:2048 -subj "/C=US/ST=Californie/L=Springfield/O=wtf/CN=wtf" -out /etc/ssl/private/vsftpd.cert.pem -keyout /etc/ssl/private/vsftpd.key.pem	

ADD vsftpd /etc/pam.d/vsftpd
ADD vsftpd.conf /etc/vsftpd.conf
EXPOSE 20 21
VOLUME /data /auth
CMD ["vsftpd","/etc/vsftpd.conf"]
