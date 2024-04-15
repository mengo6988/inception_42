#!/bin/sh

# kill $(cat /var/run/mysqld/mysqld.pid)
service mysql start

# echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;" | mysql
# echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" | mysql
# echo "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';" | mysql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" | mysql
# echo "FLUSH PRIVILEGES;" | mysql

echo 'running mysql setup-----------------------------------------------------------'
echo "CREATE DATABASE IF NOT EXISTS mysql;" | mysql
echo "CREATE USER IF NOT EXISTS mho@'% IDENTIFIED BY 'password;" | mysql
echo "GRANT ALL PRIVILEGES ON mysql.* TO 'mho'@'%';" | mysql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo 'done mariadb setup-----------------------------------------------------------'
kill $(cat /var/run/mysqld/mysqld.pid)
	
mysqld
