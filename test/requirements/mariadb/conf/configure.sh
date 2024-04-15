#!/bin/sh

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;" | mysql
echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';" | mysql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

kill $(cat /var/run/mysqld/mysqld.pid)
	
mysqld
