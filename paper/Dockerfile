FROM ghcr.io/pineman/services/base:1.4.0
ARG DEBIAN_FRONTEND=noninteractive
RUN install_clean openjdk-21-jre-headless tmux
RUN curl -O https://fill-data.papermc.io/v1/objects/8de7c52c3b02403503d16fac58003f1efef7dd7a0256786843927fa92ee57f1e/paper-1.21.8-60.jar
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
VOLUME /paper
WORKDIR /paper
