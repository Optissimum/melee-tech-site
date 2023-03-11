.PHONY: deps dev build image clean

GOCMD=go
IMAGE := r.mills.io/prologic/zs
TAG := latest

all: build

deps:
	@$(GOCMD) install git.mills.io/prologic/zs@latest
	@$(GOCMD) install git.mills.io/prologic/static@latest

dev : DEBUG=1
dev : build
	@bash -c 'trap "jobs -p | xargs kill" EXIT; \
	          zs watch & \
	          static -r .pub & \
	          echo http://localhost:8000/; \
	          wait'

build:
	@zs build

ifeq ($(PUBLISH), 1)
image:
	@docker buildx build --platform linux/amd64,linux/arm64 --push -t $(IMAGE):$(TAG) .
else
image:
	@docker build  -t $(IMAGE):$(TAG) .
endif

clean:
	@git clean -f -d -X
