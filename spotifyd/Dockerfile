FROM ubuntu:20.04 AS builder
ARG DEBIAN_FRONTEND=noninteractive
ADD https://github.com/Spotifyd/spotifyd/archive/refs/tags/v0.3.2.tar.gz .
RUN tar xzf v0.3.2.tar.gz
RUN apt-get update && \
  apt-get install -y rustc cargo libasound2-dev libssl-dev pkg-config
WORKDIR /spotifyd-0.3.2
RUN cargo build --release --locked
RUN cp target/release/spotifyd /

FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /spotifyd
RUN apt-get update && \
  apt-get install -y libasound2
COPY --from=builder /spotifyd .
VOLUME /spotifyd/cache
ENTRYPOINT ["/spotifyd/spotifyd", "--no-daemon", "-c", "/spotifyd/cache", "-d", "pinecone"]
