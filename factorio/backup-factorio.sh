FILENAME=factorio-$(date +%F_%H.%M)
cd /home/pineman/services/factorio
sudo tar cf $FILENAME.tar server_mount
sudo chown $(id -un): $FILENAME.tar
