FROM docker:dind

ARG ARCH
ENV ARCH=${ARCH}
ARG COMPOSE_VERSION
ENV COMPOSE_VERSION=${COMPOSE_VERSION}

COPY start-docker /usr/local/bin/start-docker
RUN chmod +x /usr/local/bin/start-docker

RUN mkdir -p /usr/local/lib/docker/cli-plugins && \
    wget -qO /usr/local/lib/docker/cli-plugins/docker-compose "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-linux-${ARCH}" && \
    # wget -qO /usr/local/lib/docker/cli-plugins/docker-compose "https://github.com/docker/compose/releases/download/v5.1.4/docker-compose-linux-aarch64" && \
    chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
