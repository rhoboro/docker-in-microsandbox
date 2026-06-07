ref https://docs.microsandbox.dev/recipes/docker/docker-in-sandbox

```bash
# https://github.com/docker/compose
docker build --platform linux/arm64 --build-args ARCH=aarch64 --build-args COMPOSE_VERSION=v5.1.4 -t rhoboro/docker-in-microsandbox:v5.1.4-aarch64 .
docker build --platform linux/amd64 --build-args ARCH=x86_64 --build-args COMPOSE_VERSION=v5.1.4 -t rhoboro/docker-in-microsandbox:v5.1.4-x86_64 .

# https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-to-the-container-registry
export CR_PAT=<personal access token (classic)>
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin

# https://github.com/users/rhoboro/packages/container/package/docker-in-microsandbox
docker push rhoboro/docker-in-microsandbox:v5.1.4-aarch64
docker push rhoboro/docker-in-microsandbox:v5.1.4-x86_64
```


