FROM docker.io/ubuntu:20.04 AS builder
RUN apt-get update && \
  apt-get install -y openjdk-8-jre-headless curl git
WORKDIR /spigot
RUN curl -O https://hub.spigotmc.org/jenkins/job/BuildTools/126/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev 1.16.5

FROM docker.io/ubuntu:20.04
COPY --from=builder /spigot/spigot-1.16.5.jar /
RUN apt-get update && \
  apt-get install -y openjdk-8-jre-headless
VOLUME /spigot
WORKDIR /spigot
COPY server.properties eula.txt whitelist.json /spigot/
ENTRYPOINT ["java", "-jar", "/spigot-1.16.5.jar"]
