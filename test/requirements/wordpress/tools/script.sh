#!/bin/sh

# Define how long to wait for MariaDB (seconds)
MAX_WAIT_TIME=30

# Function to test connection to MariaDB
test_db_connection() {
  echo "Trying to connect to MariaDB..."
  mysql -h $WP_DB_HOST -u $WP_DB_USER -p$WP_DB_PASSWORD $WP_DB &> /dev/null
  if [ $? -eq 0 ]; then
    echo "Connection to MariaDB successful!"
    return 0
  else
    echo "Connection failed. Retrying..."
    return 1
  fi
}

# Wait for MariaDB to be ready (with timeout)
counter=0
# connection_pass=0
# while ! test_db_connection && pass < 3; do
#   sleep 5
#   counter=$(counter+1)
#   if [ $counter -eq $MAX_WAIT_TIME ]; then
#     echo "Timeout waiting for MariaDB. Exiting..."
#     exit 1
#   fi
# done
success_count=0
while [ $success_count -lt 3 ]; do
  if test_db_connection; then
    success_count=$((success_count + 1))
    echo "Database connection successful attempt $success_count"
	sleep 5
  else
    echo "Database connection failed!"
	counter=$(counter+1)
	if [ $counter -eq $MAX_WAIT_TIME ]; then
		echo "Timeout waiting for mariadb..."
		exit 1
	fi
  fi
done

# Start WordPress now that MariaDB is ready
echo "MariaDB is ready. Starting WordPress..."

# wp cli update
if [ -f ./wp-config.php ];
then
	echo "wordpress already downloaded..."
else
	# echo "core download-----------------------------------------------"
	# wp core download --allow-root

	# echo "creating config------------------------------------------------"
	wp config create	--allow-root --dbname=$WP_DB --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=$WP_DB_HOST --path='/var/www/html'

	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

	### Create new user ###
	wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

	wp theme install twentytwentyfour --activate --allow-root

fi
# #### BONUS PART redis ####	
# wp config set WP_REDIS_HOST redis --allow-root
# wp config set WP_REDIS_PORT 6379 --raw --allow-root
# wp plugin install redis-cache --activate --allow-root
# wp plugin update --all --allow-root
# wp redis enable --allow-root
# ### end bonus ###

exec "$@"
# /usr/sbin/php-fpm8.2 -F

# #--------------------------------------------------------------------------------------------------------------
#
#
# # check if wp-config.php exist
# # Download wordpress
# #
# #--------------------------------------------------------------------------------------------------------------
# wget http://wordpress.org/latest.tar.gz
# tar xfz latest.tar.gz
# mv wordpress/* .
# rm -rf latest.tar.gz
# rm -rf wordpress
#
# chown -R www-data:root /var/www/html
# # chown -R root:root /var/www/html
#
# wp core download --allow-root
#
# echo "BEFORE SED CHECKPOINT -----"
# #Import DB env variables in the config file
# echo "#hello" >> wp-config-sample.php
# sed -i "s/username_here/$WP_DB_USER/g" wp-config-sample.php
# sed -i "s/password_here/$WP_DB_PASSWORD/g" wp-config-sample.php
# sed -i "s/localhost/$WP_DB_HOST/g" wp-config-sample.php
# sed -i "s/database_name_here/$MARIADB_DATABASE/g" wp-config-sample.php
# cp wp-config-sample.php wp-config.php
# echo "DONE WORDPRESS SH"
#
# wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PSWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
# # wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
# # wp theme install neve --activate --allow-root
#
# /usr/sbin/php-fpm8.2 -F
