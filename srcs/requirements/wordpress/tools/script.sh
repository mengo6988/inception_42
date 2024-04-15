#!/bin/bash
#
# # create directory to use in nginx container later and also to setup the wordpress conf
# mkdir /var/www/
# mkdir /var/www/html
#
# cd /var/www/html
#
# rm -rf *
#
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
#
# chmod +x wp-cli.phar 
#
# mv wp-cli.phar /usr/local/bin/wp
#
# #logs to check debugging purposes
# mkdir /run/php && mkdir /usr/log && touch /usr/log/www.access.log
#
# wp core download --allow-root
#
# wp config create --dbname=$WP_DB --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=$WP_DB_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
# wp config set WP_DEBUG true --allow-root
# wp config set WP_DEBUG_LOG true --allow-root
#
# wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
#
# ### Create new user ###
# wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
#
# wp theme install kubio --activate --allow-root
#
# #### BONUS PART redis ####	
# wp config set WP_REDIS_HOST redis --allow-root
# wp config set WP_REDIS_PORT 6379 --raw --allow-root
# wp plugin install redis-cache --activate --allow-root
# wp plugin update --all --allow-root
# wp redis enable --allow-root
# ### end bonus ###
#
# /usr/sbin/php-fpm7.4 -F


# if [ ! -f /var/www/html/wp-config.php ]
# then	
# 	wp config create --dbname=$WP_DB --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=$WP_DB_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
# 	wp config set WP_DEBUG true --allow-root
# 	wp config set WP_DEBUG_LOG true --allow-root
# 	### BONUS PART redis ###
# 	wp config set WP_REDIS_HOST redis --allow-root
# 	wp config set WP_REDIS_PORT 6379 --raw --allow-root
# 	### end bonus ###
# 	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
# 	wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
# 	wp theme install kubio --activate --allow-root
# 	#### BONUS PART redis ####	
# 	wp plugin install redis-cache --activate --allow-root
# 	wp plugin update --all --allow-root
# 	wp redis enable --allow-root
# 	### end bonus ###
# fi
cd /var/www/html

rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
echo "ping mariadb----------------------------------------------------------"
ping mariadb
echo "creating config----------------------------------"
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root


/usr/sbin/php-fpm7.4 -F
