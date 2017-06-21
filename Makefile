NAME=thefab/portable-envtpl-buildimage
VERSION=$(shell ./version.sh)

build:
	docker build -f Dockerfile -t $(NAME):$(VERSION) .

run:
	docker run --rm thefab/portable-envtpl-buildimage >portable_envtpl.tar.gz

release: build
	if test "$(VERSION)" != "dev" -a "${DOCKER_PASSWORD}" != ""; then docker login -e="${DOCKER_EMAIL}" -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"; docker push $(NAME):$(VERSION); fi
