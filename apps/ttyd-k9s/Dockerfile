# Stage 1: Builder
FROM python:3.13 AS builder

ARG K9S_VERSION=v0.50.9
ARG KUBECTL_VERSION=v1.36.0
WORKDIR /tmp

# Install curl and tar just for building
RUN apt-get update && apt-get install -y curl tar \
    && curl -fL https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_amd64.tar.gz -o k9s.tar.gz \
    && tar -zxvf k9s.tar.gz \
    && chmod +x k9s

# Setup kubectl
RUN curl -fL https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o kubectl \
    && chmod +x kubectl

# Stage 2: Final runtime
FROM tsl0922/ttyd:1.7.8-alpine

WORKDIR /usr/local/bin

COPY --from=builder /tmp/k9s /usr/local/bin/k9s
COPY --from=builder /tmp/kubectl /usr/local/bin/kubectl

ENTRYPOINT ["ttyd"]
CMD ["--writable","k9s"]
