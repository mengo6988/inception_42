FROM debian:bookworm

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server -y
RUN apt install default-mysql-client -y
# RUN apt install mysql -y
# RUN mysqladmin -u root password "$MARIADB_ROOT_PASSWORD"
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY conf/50-server.cnf /

COPY ./tools/script.sh /

ENTRYPOINT  [ "/script.sh" ]
# CMD ["bash"]

#test
# FROM debian:buster
# RUN apt-get update && apt-get install -y mariadb-server
# COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./conf/configure.sh /
# CMD ["/configure.sh"]
