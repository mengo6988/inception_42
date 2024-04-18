FROM debian:bookworm

RUN apt-get update && apt-get install -y vsftpd

COPY ./tools/script.sh /

COPY ./conf/vsftpd.conf /etc/

RUN chmod +x /script.sh

# CMD ["vsftpd", "/etc/vsftpd.conf"]

CMD ["/script.sh"]
