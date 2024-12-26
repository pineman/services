FROM ghcr.io/pineman/services/base:1.3.2
ARG DEBIAN_FRONTEND=noninteractive
RUN install_clean openjdk-17-jre-headless tmux
RUN curl -O https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/139/downloads/paper-1.19.2-139.jar
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
VOLUME /paper
WORKDIR /paper
COPY server.properties eula.txt whitelist.json ops.json server-icon.png .
COPY logs logs

