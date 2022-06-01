FROM registry.gitlab.com/pineman/services/base:1.3.2
ARG DEBIAN_FRONTEND=noninteractive
RUN install_clean openjdk-17-jre-headless tmux
RUN curl -O https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/347/downloads/paper-1.18.2-347.jar
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
VOLUME /paper
WORKDIR /paper
COPY server.properties eula.txt whitelist.json ops.json server-icon.png .
COPY logs logs
COPY plugins plugins
