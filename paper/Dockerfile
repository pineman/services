FROM registry.gitlab.com/pineman/services/base:1.1.0
ARG DEBIAN_FRONTEND=noninteractive
RUN install_clean openjdk-16-jre-headless tmux
RUN curl -O https://papermc.io/api/v2/projects/paper/versions/1.17.1/builds/110/downloads/paper-1.17.1-110.jar
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
VOLUME /paper
WORKDIR /paper
COPY server.properties eula.txt whitelist.json .
COPY logs logs