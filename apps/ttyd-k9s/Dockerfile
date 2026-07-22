FROM tsl0922/ttyd:1.7.8
ARG K9S_VERSION=v0.50.9
RUN apt-get update && apt-get install -y curl
RUN curl -fL https://github.com/derailed/k9s/releases/download/$K9S_VERSION/k9s_Linux_amd64.tar.gz -o /tmp/k9s.tar.gz
RUN tar -zvf /tmp/k9d.tar.gz -C /usr/local/bin k9s && chmod +x /usr/local/bin/k9s && rm -vf /tmp/k9s.tar.gz
ENTRYPOINT ["ttyd"]
CMD ["--writable","k9s"]