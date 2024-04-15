#!bin/sh

wp core download --allow-root

wp config create	--allow-root \
	--dbname=$WP_DB \
	--dbuser=$WP_DB_USER \
	--dbpass=$WP_DB_PASSWORD \
	--dbhost=mariadb:3306 \
	--path='/var/www/wordpress'

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

### Create new user ###
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

wp theme install kubio --activate --allow-root

# #### BONUS PART redis ####	
# wp config set WP_REDIS_HOST redis --allow-root
# wp config set WP_REDIS_PORT 6379 --raw --allow-root
# wp plugin install redis-cache --activate --allow-root
# wp plugin update --all --allow-root
# wp redis enable --allow-root
# ### end bonus ###

/usr/sbin/php-fpm8.2 -F
