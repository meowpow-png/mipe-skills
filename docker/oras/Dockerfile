ARG ORAS_VERSION=1.3.3

FROM ghcr.io/oras-project/oras:v${ORAS_VERSION} AS oras

FROM debian:bookworm-slim

COPY --from=oras /bin/oras /usr/local/bin/oras
COPY scripts/package.sh /usr/local/bin/package
COPY scripts/push.sh /usr/local/bin/push

WORKDIR /workspace
