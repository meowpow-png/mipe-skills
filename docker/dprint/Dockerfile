FROM debian:bookworm-slim

ARG DPRINT_VERSION=0.55.2

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl unzip && \
    rm -rf /var/lib/apt/lists/* && \
    curl -fsSL -o /tmp/dprint.zip "https://github.com/dprint/dprint/releases/download/${DPRINT_VERSION}/dprint-x86_64-unknown-linux-gnu.zip" && \
    unzip /tmp/dprint.zip -d /usr/local/bin && \
    rm /tmp/dprint.zip && \
    chmod +x /usr/local/bin/dprint

WORKDIR /workspace
ENTRYPOINT ["dprint"]
