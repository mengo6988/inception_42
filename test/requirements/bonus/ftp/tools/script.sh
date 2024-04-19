#!/bin/sh
#
#
# if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then
#
#     mkdir -p /var/www/html
#
#     cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
#     mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf
#
#     # Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
#     adduser $FTP_USER --disabled-password
#     echo "$FTP_USR:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
#     chown -R $FTP_USER:$FTP_USER /var/www/html
#
# 	#chmod +x /etc/vsftpd/vsftpd.conf
#     echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null
#
#
# fi

vsftpd /etc/vsftpd/vsftpd.conf

if [ ! -f "/etc/vsftpd.userlist" ]
then
	mkdir -p /var/run/vsftpd/empty
	mkdir -p /var/www/html/$FTP_USER
	useradd -m $FTP_USER
	echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> dev/null
	#to allow ftp to write files, have to change the permissions
	chown -R ftp:ftp /var/www/html/$FTP_USER
	chown -R $FTP_USER:$FTP_USER /var/www/html/$FTP_USER
	sed -i "s|local_root=/var/www/html|local_root=/var/www/html/$FTP_USER|g"
	# sed -i "s/local_root=\/var\/www\/html/local_root=\/var\/www\/html\/$FTP_USER/g"
	echo $FTP_USER > /etc/vsftpd.userlist
fi

echo "FTP starting on :21"
vsftpd /etc/vsftpd.conf
