FROM debian:bookworm

RUN apt-get clean
RUN apt-get update 

RUN apt-get install -y nginx vim curl openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MY/ST=Selangor/L=Subang/O=42/OU=42/CN=login.42.fr/UID=login"

# COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# to store nginx config files
RUN mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
