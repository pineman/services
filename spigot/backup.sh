docker run --volumes-from spigot -v $(pwd):/backup ubuntu:20.04 tar cf /backup/spigot-$(date -Iminutes).tar /spigot
sudo chown $(id -un): spigot-$(date -Iminutes).tar
