FROM docker.io/ubuntu:20.04 AS builder
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -q update && \
	apt-get -qy install --no-install-recommends \
		openjdk-8-jre-headless curl git && \
	apt-get -qy autoremove && \
	apt-get clean && \
	rm -r /var/lib/apt/lists/*
WORKDIR /spigot
RUN curl -O https://hub.spigotmc.org/jenkins/job/BuildTools/126/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev 1.16.5

FROM docker.io/ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
COPY --from=builder /spigot/spigot-1.16.5.jar /
RUN apt-get -q update && \
	apt-get -qy install --no-install-recommends \
		openjdk-8-jre-headless && \
	apt-get -qy autoremove && \
	apt-get clean && \
	rm -r /var/lib/apt/lists/*
VOLUME /spigot
WORKDIR /spigot
COPY server.properties eula.txt whitelist.json /spigot/
ENTRYPOINT ["java", "-jar", "/spigot-1.16.5.jar"]
