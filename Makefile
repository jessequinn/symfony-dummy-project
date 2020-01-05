TAG    			:= $$(git rev-parse --short HEAD)

NAME_MYSQL  	:= damasu/symfony-dummy-project-mysql
IMG_MYSQL   	:= ${NAME_MYSQL}:${TAG}
LATEST_MYSQL	:= ${NAME_MYSQL}:latest
VERSION_MYSQL	:= 5.7

NAME_PHP_FPM   	:= damasu/symfony-dummy-project-php-fpm
IMG_PHP_FPM   	:= ${NAME_PHP_FPM}:${TAG}
LATEST_PHP_FPM	:= ${NAME_PHP_FPM}:latest
VERSION_PHP_FPM	:= 7.3

NAME_NGINX   	:= damasu/symfony-dummy-project-nginx
IMG_NGINX   	:= ${NAME_NGINX}:${TAG}
LATEST_NGINX	:= ${NAME_NGINX}:latest
VERSION_NGINX	:= 1.15

ifeq ($(TYPE),mysql)
build:
	@docker build --target prod --build-arg VERSION=${VERSION_MYSQL} -f docker/mysql/Dockerfile -t ${IMG_MYSQL} .
	@docker tag ${IMG_MYSQL} ${LATEST_MYSQL}
else ifeq ($(TYPE),nginx)
build:
	@docker build --target prod --build-arg VERSION=${VERSION_NGINX} -f docker/nginx/Dockerfile -t ${IMG_NGINX} .
	@docker tag ${IMG_NGINX} ${LATEST_NGINX}
else ifeq ($(TYPE),php)
build:
	@docker build --target prod --build-arg VERSION=${VERSION_PHP_FPM} -f docker/php-fpm/Dockerfile -t ${IMG_PHP_FPM} .
	@docker tag ${IMG_PHP_FPM} ${LATEST_PHP_FPM}
endif

ifeq ($(TYPE),mysql)
push:
	@docker push ${NAME_MYSQL}
else ifeq ($(TYPE),nginx)
push:
	@docker push ${NAME_NGINX}
else ifeq ($(TYPE),php)
push:
	@docker push ${NAME_PHP_FPM}
endif

login:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
