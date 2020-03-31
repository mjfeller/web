PODMAN = podman
IMAGE  = website

build:
	${PODMAN} build -t ${IMAGE} .

run:
	${PODMAN} run -it -p 8080:8080 ${IMAGE}

install:
	cp etc/web.service /etc/systemd/system/web.service
	systemctl enable web
	systemctl start web

sync:
	rsync -vr . root@mfeller.io:~/website
	rsync -vr www root@mfeller.io:/var/

.PHONY: build run install sync
