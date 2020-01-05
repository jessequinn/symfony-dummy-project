NAME   	:= damasu/symfony-dummy-project-php-fpm
TAG    	:= $$(git rev-parse --short HEAD)
IMG    	:= ${NAME}:${TAG}
LATEST 	:= ${NAME}:latest
VERSION	:= 7.3

build:
	@docker build --target dev --build-arg VERSION=${VERSION} -t ${IMG} .
	@docker tag ${IMG} ${LATEST}

push:
	@docker push ${NAME}

login:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
