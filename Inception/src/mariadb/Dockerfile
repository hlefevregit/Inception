FROM alpine:3.20.0
EXPOSE 3306

# Intall mariadb
RUN apk update
RUN apk add --no-cache \
    mariadb \
    mariadb-client \
    su-exec \
    openrc \
    -q

# Create necessaries directories to store database
RUN mkdir -p /run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Copy our mariadb config file
COPY conf.d/my.cnf /etc/my.cnf
RUN chown -R mysql:mysql /etc/my.cnf

COPY conf.d/start_mariadb.sh /etc/start_mariadb.sh
RUN chmod 755 /etc/start_mariadb.sh

# Start mariadb
# USER mysql
USER root
CMD ["/etc/start_mariadb.sh"]