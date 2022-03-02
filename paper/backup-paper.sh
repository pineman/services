docker exec paper /usr/bin/tmux send-keys save-off C-m save-all C-m
sleep 10s
FILENAME=paper-$(date +%F_%H.%M)
cd /home/pineman/services/paper
sudo tar cf $FILENAME.tar server_mount
sudo chown $(id -un): $FILENAME.tar
docker exec paper /usr/bin/tmux send-keys save-on C-m
