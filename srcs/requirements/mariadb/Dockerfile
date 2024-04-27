# Use the official Debian image as the base image
#FROM debian_imagen_local:latest
FROM debian:11.8
RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until
# Install necessary packages
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN rm -rf /var/lib/apt/lists/*
# Create the directory for the MySQL socket
RUN mkdir -p /run/mysqld/ && \
    chown -R mysql:mysql /run/mysqld/ && \
    chmod -R 777 /run/mysqld
# Set environment variables for MariaDB
#NOT HERE.
# Copy the initialization SQL script and .cnf file into the container
COPY ./conf/init.sql /docker-entrypoint-initdb.d/
COPY ./conf/init.sh /etc/mysql/
RUN chmod +x /etc/mysql/init.sh
# Expose the default MariaDB port
EXPOSE 3306
# Install Tini
ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
RUN chmod +x /tini
# Set the entrypoint using Tini and run the init.sh script
ENTRYPOINT ["/tini", "--"]
#ENTRYPOINT ["/tini", "--debug", "/etc/mysql/init.sh"]
# Start the MariaDB service
#CMD ["mysqld", "--init-file=/docker-entrypoint-initdb.d/init.sql"]
#exec the script for initialize the service
CMD ["bash", "/etc/mysql/init.sh"]