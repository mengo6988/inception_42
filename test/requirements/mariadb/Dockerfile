FROM debian:bookworm

RUN apt update -y && apt upgrade -y

# RUN apt-get update
# RUN apt-get install mariadb-server -y
# RUN apt-get install default-mysql-client -y

RUN apt install mariadb-server -y
RUN apt install default-mysql-client -y
# WORKDIR /var/lib/mysql
# RUN apt install mysql -y
# RUN mysqladmin -u root password "$MARIADB_ROOT_PASSWORD"
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY conf/50-server.cnf /

COPY ./tools/script.sh /

# ENTRYPOINT  [ "/script.sh" ]
ENTRYPOINT  [ "/script.sh" ]

CMD ["mysqld_safe"]
# CMD ["bash"]

#test
# FROM debian:buster
# RUN apt-get update && apt-get install -y mariadb-server
# COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./conf/configure.sh /
# CMD ["/configure.sh"]
