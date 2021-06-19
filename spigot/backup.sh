docker run --volumes-from spigot -v $(pwd):/backup ubuntu:20.04 tar cf /backup/spigot-$(date +%F_%H.%M).tar /spigot
sudo chown $(id -un): *.tar
