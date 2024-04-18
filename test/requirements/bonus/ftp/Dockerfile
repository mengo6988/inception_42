FROM debian:bookworm

RUN apt-get update && apt-get install -y vsftpd

COPY ./tools/script.sh /

CMD ["vsftpd", "/etc/vsftpd.conf"]
