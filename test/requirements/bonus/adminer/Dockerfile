FROM debian:bookworm

RUN apt-get update && apt-get install wget php php-mysql -y

COPY ./tools/script.sh /

RUN chmod +x /script.sh

WORKDIR /var/www/html

CMD ["/script.sh"]
