.PHONY: help install dependencies build clean

export DOCKER_BUILDKIT := 1
export COMPOSE_DOCKER_CLI_BUILD := 1

NAME := compilerbook
TIME_ZONE := Asia/Tokyo
DEBIAN_FRONTEND := noninteractive

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	Dockerfile

dependencies:
	type docker > /dev/null
	type curl > /dev/null

Dockerfile:
	curl https://www.sigbus.info/compilerbook/Dockerfile > $@

build:
	docker build \
		-t $(NAME) \
		--build-arg TIME_ZONE=$(TIME_ZONE) \
		--build-arg DEBIAN_FRONTEND=$(DEBIAN_FRONTEND) \
		.

clean:
	docker image rm compilerbook
