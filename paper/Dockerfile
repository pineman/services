FROM registry.gitlab.com/pineman/services/base:1.1.0
ARG DEBIAN_FRONTEND=noninteractive
RUN install_clean openjdk-17-jre-headless tmux
RUN curl -O https://papermc.io/api/v2/projects/paper/versions/1.18/builds/66/downloads/paper-1.18-66.jar
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
VOLUME /paper
WORKDIR /paper
COPY server.properties eula.txt whitelist.json ops.json server-icon.png .
COPY logs logs
COPY plugins plugins
