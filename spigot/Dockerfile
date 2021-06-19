FROM registry.gitlab.com/pineman/images/base:1.0.0 AS builder
ARG DEBIAN_FRONTEND=noninteractive
RUN install_clean openjdk-16-jre-headless curl git
WORKDIR /spigot
RUN curl -O https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev 1.17

FROM registry.gitlab.com/pineman/images/base:1.0.0
ARG DEBIAN_FRONTEND=noninteractive
COPY --from=builder /spigot/spigot-1.17.jar /
RUN install_clean openjdk-16-jre-headless
VOLUME /spigot
WORKDIR /spigot
COPY server.properties eula.txt whitelist.json /spigot/
ENTRYPOINT ["java", "-jar", "/spigot-1.17.jar"]
