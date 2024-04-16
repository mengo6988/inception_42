FROM debian:bookworm

WORKDIR /var/www/html

RUN apt-get update -y
RUN apt-get install wget curl -y

RUN apt-get install php-fpm php-mysql mariadb-client -y

RUN wget http://wordpress.org/latest.tar.gz -P /var/www/html

RUN tar -xzf latest.tar.gz && rm latest.tar.gz

RUN chown -R root:root /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

RUN wp core download --allow-root

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY ./tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

# CMD ["bash"]
ENTRYPOINT [ "/usr/local/bin/script.sh"]

CMD ["/usr/sbin/php-fpm8.2", "-F"]
