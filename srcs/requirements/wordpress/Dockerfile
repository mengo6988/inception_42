FROM debian:bullseye

RUN apt-get update && apt-get install -y php-fpm php-mysql curl wget php-mysqli -y

# RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
# RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
#
# RUN sed -i 's/;access.log = log\/$pool.access.log/access.log = log\/$pool.access.log/g' /etc/php/7.4/fpm/pool.d/www.conf
#
# WORKDIR /var/www/html
#
# RUN mkdir /run/php && mkdir /usr/log && touch /usr/log/www.access.log
#
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# RUN chmod +x wp-cli.phar
#
# RUN mv wp-cli.phar /usr/local/bin/wp
#
# RUN wp core download --allow-root
#
COPY ./tools/ /

RUN chmod +x /script.sh

# RUN wp config create --dbname=$WP_DB --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=$WP_DB_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
#
# CMD [ "php-fpm7.4", "-F" ]
CMD [ "/script.sh"]

# CMD ["bash"]
