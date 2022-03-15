FROM registry.gitlab.com/pineman/services/base:1.1.0
RUN curl -LO https://github.com/traefik/traefik/releases/download/v2.6.1/traefik_v2.6.1_linux_amd64.tar.gz
RUN tar xvzf traefik_2.6.1_linux_amd64.tar.gz
COPY traefik.yaml /etc/traefik/traefik.yaml
COPY routes.yaml /etc/traefik/routes.yaml
ENTRYPOINT /bin/sh
