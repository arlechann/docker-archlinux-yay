IMAGE := archlinux-yay
VERSION := latest

.PHONY: build clean

build:
	docker build . -t $(IMAGE):$(VERSION)

clean:
	docker rmi $(IMAGE):$(VERSION)
