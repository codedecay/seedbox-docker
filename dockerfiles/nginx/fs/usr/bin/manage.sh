#!/bin/sh

OPTS=$1

chown -R www-data:www-data /var/www

if [ $OPTS == "add" ]
then
	read -p 'username : ' USERNAME
	read -s -p 'password : ' PASSWORD
	read -s -p 'retape password : ' PASSWORD_AGAIN

	if [ $PASSWORD != $PASSWORD_AGAIN ]
	then
		echo "password not matching"
		exit
	else
		grep $USERNAME /auth/passwd > /dev/null 2>&1
		if [ $? -ne 0 ]
		then
			echo "${USERNAME}:$(openssl passwd -1 -noverify ${PASSWORD})" >> /auth/passwd
		fi
		sed 's/<username>/'$USERNAME'/g' /sites.d/sickrage/template >> /sites.d/sickrage/$USERNAME.conf
		sed 's/<username>/'$USERNAME'/g' /sites.d/torrent/template >> /sites.d/torrent/$USERNAME.conf
	fi
elif [ $OPTS == "start" ]
then
	if [ -e /auth/passwd ]
	then
		for user in $(cat /auth/passwd | cut -d: -f1)
		do
                	sed 's/<username>/'$user'/g' /sites.d/sickrage/template >> /sites.d/sickrage/$user.conf
                	sed 's/<username>/'$user'/g' /sites.d/torrent/template >> /sites.d/torrent/$user.conf
		done
	else
		manage.sh add
	fi
	supervisord
elif [ $OPTS == "del" ]
then
	read -p 'username : ' USERNAME

	grep $USERNAME /auth/passwd > /dev/null 2>&1
	
	if [ $? -eq 0 ]
	then
		sed -i '/^'$USERNAME'/ d' /auth/passwd
		rm -rf /sites.d/*/${USERNAME}.conf
	else
		echo "username not found"
		exit
	fi	
else
	echo "invalid option"
	exit
fi

