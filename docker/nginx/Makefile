NAME   	:= damasu/symfony-dummy-project-nginx
TAG    	:= $$(git rev-parse --short HEAD)
IMG    	:= ${NAME}:${TAG}
LATEST 	:= ${NAME}:latest
VERSION	:= 1.15

build:
	@docker build --target dev --build-arg VERSION=${VERSION} -t ${IMG} .
	@docker tag ${IMG} ${LATEST}

push:
	@docker push ${NAME}

login:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
