#!bin/sh

# apt install mariadb-server -y;
# apt install default-mysql-client -y;
# mv /50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# service mariadb start;
#
# # mysql -e "USE mysql;"
# mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
# mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$MARIADB_ROOT_PASSWORD shutdown
# kill $(cat /var/run/mysqld/mysqld.pid)
# exec mysqld_safe
#
#
# mysqld
#!/bin/sh

if [ -d /var/lib/mysql/$MARIADB_DATABASE ]; then
	echo "Database already exists"
else
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql > /dev/null
		touch /usr/local/bin/init.sql
		echo "USE mysql;
			FLUSH PRIVILEGES;
			CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;
			GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
			GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO 'root' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
			ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
			FLUSH PRIVILEGES;" > /usr/local/bin/init.sql
	mysqld --user=mysql --bootstrap < /usr/local/bin/init.sql
fi
# kill $(cat /var/run/mysqld/mysqld.pid)

exec mysqld_safe
