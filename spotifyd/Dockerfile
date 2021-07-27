FROM registry.gitlab.com/pineman/services/base:1.1.0 AS builder
ARG DEBIAN_FRONTEND=noninteractive
ADD https://github.com/Spotifyd/spotifyd/archive/refs/tags/v0.3.2.tar.gz .
RUN tar xzf v0.3.2.tar.gz
RUN install_clean ca-certificates rustc cargo libasound2-dev libssl-dev pkg-config
WORKDIR /spotifyd-0.3.2
RUN cargo build --release --locked
RUN cp target/release/spotifyd /

FROM registry.gitlab.com/pineman/services/base:1.1.0
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /spotifyd
RUN install_clean libasound2 alsa-utils
COPY --from=builder /spotifyd .
VOLUME /spotifyd/cache
COPY spotifyd.sh spotifyd_pwd.txt .
ENTRYPOINT ["/spotifyd/spotifyd.sh"]
