FROM ubuntu:20.04 AS builder
ARG DEBIAN_FRONTEND=noninteractive
ADD https://github.com/Spotifyd/spotifyd/archive/refs/tags/v0.3.2.tar.gz .
RUN tar xzf v0.3.2.tar.gz
RUN apt-get -q update && \
	apt-get -qy install --no-install-recommends \
		ca-certificates rustc cargo libasound2-dev libssl-dev pkg-config && \
	apt-get -qy autoremove && \
	apt-get clean && \
	rm -r /var/lib/apt/lists/*
WORKDIR /spotifyd-0.3.2
RUN cargo build --release --locked
RUN cp target/release/spotifyd /

FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /spotifyd
RUN apt-get -q update && \
	apt-get -qy install --no-install-recommends \
		libasound2 alsa-utils && \
	apt-get -qy autoremove && \
	apt-get clean && \
	rm -r /var/lib/apt/lists/*
COPY --from=builder /spotifyd .
VOLUME /spotifyd/cache
COPY spotifyd.sh .
ENTRYPOINT ["/spotifyd/spotifyd.sh"]
