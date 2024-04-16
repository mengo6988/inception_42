FROM debian:bookworm

RUN apt-get update -y
RUN apt-get install wget curl -y

RUN apt-get install php-fpm php-mysql mariadb-client -y

# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
# RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# RUN chown -R root:root /var/www/wordpress

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
WORKDIR /var/www/html/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

# RUN wp core download --allow-root

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY ./tools/script.sh /

RUN chmod +x /script.sh


# CMD ["bash"]
CMD ["/script.sh"]
