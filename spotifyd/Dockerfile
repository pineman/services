FROM docker.io/archlinux:base-20210502.0.21321
RUN pacman -Syu --noconfirm && pacman -S --noconfirm spotifyd alsa-utils && rm -rf /var/cache/pacman/pkg/*
WORKDIR /spotifyd
VOLUME /spotifyd/cache
COPY spotifyd.sh .
ENTRYPOINT ["/spotifyd/spotifyd.sh"]
