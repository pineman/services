FROM archlinux:base-devel-20220227.0.49015
COPY factorio-headless-1.1.48-1-x86_64.pkg.tar.zst /
RUN pacman -U /factorio-headless-1.1.48-1-x86_64.pkg.tar.zst --noconfirm
WORKDIR /root
VOLUME /root
COPY entrypoint.sh .
ENTRYPOINT ./entrypoint.sh
