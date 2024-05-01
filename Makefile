up:
	docker-compose -f /home/vcereced/Desktop/inception/srcs/docker-compose.yml up

down:
	docker-compose -f /home/vcereced/Desktop/inception/srcs/docker-compose.yml down

setup:
	@(mkdir -p /home/vcereced/data/wpsite > /dev/null 2>&1 && echo "Created data/wpsite") || echo "data/wpsite already created"
	
	@(mkdir -p /home/vcereced/data/mariadb > /dev/null 2>&1 && echo "Created data/mariadb")|| echo "data/wpsite already created"
	@cp -n /home/vcereced/Desktop/inception/srcs/requirements/wordpress/tools/test.php /home/vcereced/data/wpsite/test.php
	@if [ -f "/home/vcereced/data/wpsite/test.php" ]; then \
        echo "test.php in volumen wpsite OK"; \
    else \
        echo "NOT FOUND test.php"; \
    fi
	
