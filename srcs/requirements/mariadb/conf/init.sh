#!/bin/bash
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" > /etc/mysql/tmp
echo "CREATE USER IF NOT EXISTS '$USER1'@'%' IDENTIFIED BY '$USER1_PASSWORD';" >> /etc/mysql/tmp
echo "CREATE USER IF NOT EXISTS '$USER2'@'%' IDENTIFIED BY '$USER2_PASSWORD';" >> /etc/mysql/tmp
echo "GRANT ALL PRIVILEGES ON *.* TO '$USER1'@'%' ;" >> /etc/mysql/tmp
echo "GRANT ALL PRIVILEGES ON *.* TO '$USER2'@'%' ;" >> /etc/mysql/tmp
echo "CREATE DATABASE IF NOT EXISTS '$DB_NAME';"
cat /etc/mysql/tmp /docker-entrypoint-initdb.d/init.sql > /etc/mysql/tmp2
mv /etc/mysql/tmp2 /docker-entrypoint-initdb.d/init.sql
sed -i 's/^bind-address\s*=.*$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
exec mysqld --init-file=/docker-entrypoint-initdb.d/init.sql