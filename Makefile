-include environ.inc
.PHONY: deps dev build install image release test clean

GOCMD=go
REGISTRY=<registry>
IMAGE=<image>

all: build

deps:
	@$(GOCMD) install git.mills.io/prologic/zs@latest
	@$(GOCMD) install git.mills.io/prologic/static@latest

dev : DEBUG=1
dev : build
	@zs watch

build:
	@zs build

ifeq ($(PUBLISH), 1)
image:
	@docker build -t $(REGISTRY)/$(IMAGE) .
	@docker push $(REGISTRY)/$(IMAGE)
else
image:
	@docker build -t $(REGISTRY)/$(IMAGE) .
endif

clean:
	@git clean -f -d -X
