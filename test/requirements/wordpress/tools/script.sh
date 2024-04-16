#!/bin/sh

# wp core download --allow-root
# # chown -R www-data:root /var/www/html
#
# echo "creating wp config"
# wp config create --allow-root \
# 	--dbname=$WP_DB \
# 	--dbuser=$WP_DB_USER \
# 	--dbpass=$WP_DB_PASSWORD \
# 	--dbhost=mariadb:3306 \
# 	--path='/var/www/wordpress'
#
# echo "core install running"
# wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
#
# ### Create new user ###
# wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
#
# wp theme install twenty twenty-four --activate --allow-root
#
# # #### BONUS PART redis ####	
# # wp config set WP_REDIS_HOST redis --allow-root
# # wp config set WP_REDIS_PORT 6379 --raw --allow-root
# # wp plugin install redis-cache --activate --allow-root
# # wp plugin update --all --allow-root
# # wp redis enable --allow-root
# # ### end bonus ###
# /usr/sbin/php-fpm8.2 -F

#!/bin/sh
#--------------------------------------------------------------------------------------------------------------
# if [ ! -f /var/www/html/wp-config.php ]
# then	
# 	wp config create --dbname=$WP_DB --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=$WP_DB_HOST:3306 --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
# 	wp config set WP_DEBUG true --allow-root
# 	wp config set WP_DEBUG_LOG true --allow-root
# 	### BONUS PART redis ###
# 	# wp config set WP_REDIS_HOST redis --allow-root
# 	# wp config set WP_REDIS_PORT 6379 --raw --allow-root
# 	### end bonus ###
# 	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
# 	wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
# 	wp theme install neve --activate --allow-root
# 	#### BONUS PART redis ####	
# 	# wp plugin install redis-cache --activate --allow-root
# 	# wp plugin update --all --allow-root
# 	# wp redis enable --allow-root
# 	### end bonus ###
# fi
#
# /usr/sbin/php-fpm8.2 -F
#--------------------------------------------------------------------------------------------------------------


# check if wp-config.php exist
# Download wordpress
#
#--------------------------------------------------------------------------------------------------------------
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

chown -R www-data:root /var/www/html
# chown -R root:root /var/www/html

wp core download --allow-root

echo "BEFORE SED CHECKPOINT -----"
#Import DB env variables in the config file
echo "#hello" >> wp-config-sample.php
sed -i "s/username_here/$WP_DB_USER/g" wp-config-sample.php
sed -i "s/password_here/$WP_DB_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$WP_DB_HOST/g" wp-config-sample.php
sed -i "s/database_name_here/$MARIADB_DATABASE/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php
echo "DONE WORDPRESS SH"

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PSWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
# wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
# wp theme install neve --activate --allow-root

/usr/sbin/php-fpm8.2 -F

# exec is just used to replace existing process, where this process is killed the moment the command is ran - for optimization
# e.g sh exec command (would repladce the sh process, and run ./command as the main process)
# just to free up resources
