# Usage

`msb-docker` is a short script to create docker-in-sandbox vm.

refs. https://docs.microsandbox.dev/recipes/docker/docker-in-sandbox

```bash
# create
$ msb-docker myvm . --port 8080:8080
myvm
Starting Docker. ready
msb exec myvm -- docker run --rm hello-world

# run docker container
$ msb exec myvm -- docker run --rm hello-world

# stop and restart
$ msb stop myvm
$ msb exec myvm -- start-docker
$ msb exec myvm -- docker run --rm hello-world

# cleanup
$ msb rm -f myvm
```

# Build image

```bash
# https://github.com/docker/compose
docker build --platform linux/arm64 --build-arg ARCH=aarch64 --build-arg COMPOSE_VERSION=v5.1.4 -t ghcr.io/rhoboro/docker-in-microsandbox:v5.1.4-aarch64 .
docker build --platform linux/amd64 --build-arg ARCH=x86_64 --build-arg COMPOSE_VERSION=v5.1.4 -t ghcr.io/rhoboro/docker-in-microsandbox:v5.1.4-x86_64 .

# https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-to-the-container-registry
export CR_PAT=<personal access token (classic)>
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin

# https://github.com/users/ghcr.io/rhoboro/packages/container/package/docker-in-microsandbox
docker push ghcr.io/rhoboro/docker-in-microsandbox:v5.1.4-aarch64
docker push ghcr.io/rhoboro/docker-in-microsandbox:v5.1.4-x86_64
```
