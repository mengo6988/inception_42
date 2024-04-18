FROM debian:bookworm

RUN apt-get update

RUN apt-get install -y redis

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["/script.sh"]

