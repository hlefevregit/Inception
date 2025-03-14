FROM alpine:3.20.0
EXPOSE 3306

RUN apk update
RUN apk add --no-cache \
    mariadb \
    mariadb-client \
    su-exec \
    openrc \
    -q

RUN mkdir -p /run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY conf.d/my.cnf /etc/my.cnf
RUN chown -R mysql:mysql /etc/my.cnf

COPY conf.d/start_mariadb.sh /etc/start_mariadb.sh
RUN chmod 755 /etc/start_mariadb.sh

USER root
CMD ["/etc/start_mariadb.sh"]