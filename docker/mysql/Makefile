NAME   	:= damasu/symfony-dummy-project-mysql
TAG    	:= $$(git rev-parse --short HEAD)
IMG    	:= ${NAME}:${TAG}
LATEST 	:= ${NAME}:latest
VERSION	:= 5.7

build:
	@docker build --target prod --build-arg VERSION=${VERSION} -t ${IMG} .
	@docker tag ${IMG} ${LATEST}

push:
	@docker push ${NAME}

login:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
