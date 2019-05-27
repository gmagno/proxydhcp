
.PHONY: build
build:
	docker build -f Dockerfile -t proxydhcp .

.PHONY: run
run:
	docker run \
		--rm -it \
		--net=host \
		--cap-add=NET_ADMIN \
		-v ${PWD}/dnsmasq.conf:/etc/dnsmasq.conf \
		-v ${PWD}/tftpboot:/tftpboot \
		proxydhcp

.PHONY: run-dev
run-dev:
	docker run \
		--rm -it \
		--net=host \
		--cap-add=NET_ADMIN \
		-v ${PWD}/dnsmasq.conf:/etc/dnsmasq.conf \
		-v ${PWD}/tftpboot:/tftpboot \
		proxydhcp sh
