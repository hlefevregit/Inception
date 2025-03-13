#!/bin/sh

set -e

if [ ! -d /var/lib/mysql/mysql ]; then
    echo "📦 Initializing MariaDB..."

    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    echo "🔧 Setting up database and users..."

    mysqld --user=mysql --bootstrap <<EOF
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF
fi

echo "🚀 MariaDB container is ready! Starting mysqld..."
exec mysqld_safe --user=mysql
