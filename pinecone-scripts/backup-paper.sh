docker run --volumes-from paper -v $(pwd):/backup ubuntu:20.04 tar cf /backup/paper-$(date +%F_%H.%M).tar /paper
sudo chown $(id -un): *.tar
