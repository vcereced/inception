# Use the official Debian image as the base image
FROM debian:11.8

# Install necessary packages
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN rm -rf /var/lib/apt/lists/*

# Create the directory for the MySQL socket
RUN mkdir -p /run/mysqld/ && \
    chown -R mysql:mysql /run/mysqld/ && \
    chmod -R 755 /run/mysqld 

#COPY ./conf/init.sql /docker-entrypoint-initdb.d/
COPY ./conf/init.sh /etc/mysql/
RUN chmod +x /etc/mysql/init.sh

# Expose the default MariaDB port
EXPOSE 3306

# Install Tini
ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
RUN chmod +x /tini

# Set the entrypoint using Tini and run the init.sh script
ENTRYPOINT ["/tini", "--"]

#exec the script for initialize the service
CMD ["bash", "/etc/mysql/init.sh"]