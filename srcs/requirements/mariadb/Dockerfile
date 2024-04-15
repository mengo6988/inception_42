FROM debian:bullseye

RUN apt-get update && apt-get install -y -q mariadb-server

# COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/script.sh /
# COPY ./tools/init.sql /etc/mysql/init.sql

RUN mkdir -p /run/mysqld

# CMD ["mysqld"]
CMD ["/script.sh"]
# CMD ["bash"]
