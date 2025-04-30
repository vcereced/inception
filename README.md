
<p align="center">
  <a>
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/42_Logo.svg/1200px-42_Logo.svg.png" alt="Logo" width="200" height="200">
  </a>

  <p align="center">
    Stack of Wordpress, MariaDB and Nginx <br>
    services using Docker Compose.
    <br />
	</p>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Makefile-8A2BE2">
  <img src="https://img.shields.io/badge/C-4682B4">
  <img src="https://img.shields.io/badge/Shell-2E8B57">
  <img src="https://img.shields.io/badge/Gcc-00FF00">
</p>

## &#x1F4CC; Index 
- [What is Inception?](#-what-is-inception)
- [Usage](#-usage)
- [Examples](#-examples)

## &#x2728; What is inception?

This project aims to broaden system administration knowledge through the use of Docker technology. It virtualizes several Docker images and configures and deploys a complete stack with WordPress, MariaDB, and Nginx services, each in its own Docker container within the same Docker network using Docker Compose.
- **WordPress**:  runs on PHP-FPM, with its own volume and exposes port 9000 internally within the Docker network. It includes two users, one of them an administrator.
- **MariaDB**: database for WordPress, with its own volume, exposes port 3306 internally.
- **Nginx**:web server that serves WordPress over HTTPS, exposes port 443 to the outside of the Docker network. It must be the sole entry point into the infrastructure, accessible only via port 443, using the TLSv1.2 or TLSv1.3 protocol.

<p align="center">
  <img width="50%" alt="Screen Shot 2024-03-07 at 12 03 04 PM" src="https://github.com/user-attachments/assets/7757d7ab-927a-44ec-a62b-8ac2ae17c32b">
</p>


## &#x1F4BB; Usage
create on the root of the proyect a `.env` like this:
```
# WordPress
WP_URL=https://localhost
WP_TITLE=MiSitioWP
WP_ADMIN_USER=admin
WP_ADMIN_PASSWORD=adminpassword
WP_ADMIN_EMAIL=admin@example.com
WP_USER=user
WP_USER_PASSWORD=userpassword
WP_PASSWORD=user1password
DB_HOST=dbcontainer
WP_USER_EMAIL=user@example.com

# MariaDB
MYSQL_ROOT_PASSWORD=rootpassword
USER1=user1
USER2=use2
USER1_PASSWORD=user1password
USER2_PASSWORD=user2password
DB_NAME=mariadb 

```

`make up` then `make up` to deploy the proyect dockerized. 

`make down` to stop and remove the containers, network but dont remove the volumens.

`make fclean` stop and remove containers, network, volumens, images, cache.
