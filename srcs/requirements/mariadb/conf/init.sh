#!/bin/bash

mkdir /docker-entrypoint-initdb.d/
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" > /docker-entrypoint-initdb.d/init.sql
echo "CREATE USER IF NOT EXISTS '$USER1'@'%' IDENTIFIED BY '$USER1_PASSWORD';" >> /docker-entrypoint-initdb.d/init.sql
echo "CREATE USER IF NOT EXISTS '$USER2'@'%' IDENTIFIED BY '$USER2_PASSWORD';" >> /docker-entrypoint-initdb.d/init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$USER1'@'%';" >> /docker-entrypoint-initdb.d/init.sql
echo "GRANT SELECT ON *.* TO '$USER2'@'%';" >> /docker-entrypoint-initdb.d/init.sql
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" >> /docker-entrypoint-initdb.d/init.sql

sed -i 's/^bind-address\s*=.*$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
exec mysqld --init-file=/docker-entrypoint-initdb.d/init.sql