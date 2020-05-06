.PHONY: help install dependencies build clean

export DOCKER_BUILDKIT := 1
export COMPOSE_DOCKER_CLI_BUILD := 1

NAME := compilerbook

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	Dockerfile

dependencies:
	type docker > /dev/null

Dockerfile:
	curl https://www.sigbus.info/compilerbook/Dockerfile > $@

build:
	docker build -t $(NAME) .

clean:
	docker rm compilerbook
