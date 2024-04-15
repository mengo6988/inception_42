FROM debian:bullseye

RUN apt-get update && apt-get install -y -q nginx 

RUN mkdir -p /etc/nginx/ssl

COPY ./conf/global.conf /etc/nginx/conf.d/global.conf
# COPY ./conf/default /etc/nginx/sites-available/.

COPY ./tools /etc/nginx/ssl

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
