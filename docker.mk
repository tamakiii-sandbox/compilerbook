.PHONY: help install dependencies build bash clean

export DOCKER_BUILDKIT := 1
export COMPOSE_DOCKER_CLI_BUILD := 1

NAME := compilerbook
TIME_ZONE := Asia/Tokyo
DEBIAN_FRONTEND := noninteractive

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	.env

dependencies:
	type docker > /dev/null
	type docker-compose > /dev/null
	type curl > /dev/null

.env:
	echo "TIME_ZONE=$(TIME_ZONE)" > $@
	echo "DEBIAN_FRONTEND=$(DEBIAN_FRONTEND)" >> $@

Dockerfile:
	curl https://www.sigbus.info/compilerbook/Dockerfile > $@

build:
	docker-compose build

bash:
	docker-compose run --rm compilerbook $@ -l

clean:
	docker image rm compilerbook
