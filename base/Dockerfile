FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ADD ./install_clean /usr/bin
RUN install_clean locales apt-transport-https ca-certificates curl lsb-release gnupg
RUN locale-gen en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
