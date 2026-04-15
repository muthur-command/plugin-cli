ARG BUILD_FROM=ghcr.io/muthur-command/base:3.23
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/ash", "-o", "pipefail", "-c"]

WORKDIR /usr/src

# Install rlwrap
ARG RLWRAP_VERSION=0.46.1
RUN apk add --no-cache --virtual .build-deps \
        build-base \
        readline-dev \
        ncurses-dev \
    && curl -L -s "https://github.com/hanslub42/rlwrap/releases/download/${RLWRAP_VERSION}/rlwrap-${RLWRAP_VERSION}.tar.gz" \
        | tar zxvf - -C /usr/src/ \
    && cd rlwrap-${RLWRAP_VERSION} \
    && ./configure \
    && make \
    && make install \
    && apk del .build-deps \
    && rm -rf /usr/src/*

# Install prebuilt `mc` (must match CLI_VERSION assets on the release).
# P0 default: muthur-command/cli. CI may pass build-args until that repo publishes mc_* for this version.
ARG CLI_VERSION=5.0.0
ARG CLI_ORG=muthur-command
ARG CLI_REPO=cli
ARG TARGETARCH
RUN \
    if [ -z "${TARGETARCH}" ]; then \
        echo "TARGETARCH is not set, please use Docker BuildKit for the build." && exit 1; \
    fi \
    && case "${TARGETARCH}" in \
            amd64) CLI_ARCH="amd64" ;; \
            arm64) CLI_ARCH="aarch64" ;; \
            *) echo "Unsupported TARGETARCH: ${TARGETARCH}" && exit 1 ;; \
        esac \
    && curl -Lfso /usr/bin/mc "https://github.com/${CLI_ORG}/${CLI_REPO}/releases/download/${CLI_VERSION}/mc_${CLI_ARCH}" \
    && chmod a+x /usr/bin/mc

COPY rootfs /
WORKDIR /

LABEL \
    io.mcio.type="cli" \
    org.opencontainers.image.title="MCOS CLI plugin" \
    org.opencontainers.image.description="Supervisor-managed CLI plugin container for MCOS" \
    org.opencontainers.image.authors="muthur-command (fork; upstream copyright in LICENSE)" \
    org.opencontainers.image.url="https://github.com/muthur-command/plugin-cli" \
    org.opencontainers.image.documentation="https://github.com/muthur-command/plugin-cli" \
    org.opencontainers.image.licenses="Apache License 2.0"
