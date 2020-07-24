#Makefile 
.PHONY: examples
THIS_DIR := $(realpath .)
DOCKER_CONTEXT := $(THIS_DIR)
GIT_TAG ?= $(shell git describe --tags --always --dirty | sed 's/^v//')
build:
	@docker build $(DOCKER_CONTEXT) \
		--build-arg PACKAGE_INDEX=$(PIP_INDEX_URL) \
		-t $(IMAGE_TAG) \
		-f $(DOCKER_CONTEXT)/Dockerfile
	@docker build $(DOCKER_CONTEXT) \
		--build-arg BASE_IMAGE=$(IMAGE_TAG) \
		-t $(IMAGE_TAG) \
		-f $(DOCKER_CONTEXT)/Dockerfile.User
