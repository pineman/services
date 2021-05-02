FROM registry.gitlab.com/pineman/images/base:1.0.0 AS builder
ARG DEBIAN_FRONTEND=noninteractive
RUN install_clean openjdk-8-jre-headless curl git
WORKDIR /spigot
RUN curl -O https://hub.spigotmc.org/jenkins/job/BuildTools/126/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev 1.16.5

FROM registry.gitlab.com/pineman/images/base:1.0.0
ARG DEBIAN_FRONTEND=noninteractive
COPY --from=builder /spigot/spigot-1.16.5.jar /
RUN install_clean openjdk-8-jre-headless
VOLUME /spigot
WORKDIR /spigot
COPY server.properties eula.txt whitelist.json /spigot/
ENTRYPOINT ["java", "-jar", "/spigot-1.16.5.jar"]
