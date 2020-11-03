.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile     := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

tag := sasaplus1/docker-fix-orientation

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: build
build: ## build Docker image
	DOCKER_BUILDKIT=1 docker build -t $(tag) .

.PHONY: run
run: options := --rm --volume "$$PWD:/mnt"
run: ## run Docker container
	find share -type f -name '*.jpg' -print | sed -e 's|^|/mnt/|' | xargs docker run $(options) $(tag)

.PHONY: sh
sh: options := -it --rm --volume "$$PWD:/mnt" --entrypoint bash
sh: ## run Docker container and execute shell
	docker run $(options) $(tag)
