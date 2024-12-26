FROM ghcr.io/pineman/services/base:1.4.0
ARG DEBIAN_FRONTEND=noninteractive
RUN install_clean openjdk-21-jre-headless tmux
RUN curl -O https://api.papermc.io/v2/projects/paper/versions/1.21.3/builds/82/downloads/paper-1.21.3-82.jar
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
VOLUME /paper-primos
WORKDIR /paper-primos

