FILENAME=factorio-$(date +%F_%H.%M)
cd /home/pineman/services/factorio
sudo chown -R $(id -un): server_mount
tar cf $FILENAME.tar server_mount
zstdmt -q --rm $FILENAME.tar
