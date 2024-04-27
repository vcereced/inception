up:
	docker-compose -f /home/vcereced/Desktop/inception/srcs/docker-compose.yml up

down:
	docker-compose -f /home/vcereced/Desktop/inception/srcs/docker-compose.yml down

setup:
	@(mkdir /home/vcereced/volumes/wpsite > /dev/null 2>&1 && echo "Created volumes/wpsite") || echo "volumes/wpsite already created"
	
	@(mkdir /home/vcereced/volumes/mariadb > /dev/null 2>&1 && echo "Created volumes/mariadb")|| echo "volumes/wpsite already created"
	@cp -n /home/vcereced/Desktop/inception/srcs/requirements/wordpress/tools/test.php /home/vcereced/volumes/wpsite/test.php
	@if [ -f "/home/vcereced/volumes/wpsite/test.php" ]; then \
        echo "test.php in volumen wpsite OK"; \
    else \
        echo "NOT FOUND test.php"; \
    fi
	
