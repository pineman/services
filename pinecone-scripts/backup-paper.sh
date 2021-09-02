docker exec paper /usr/bin/tmux send-keys save-off C-m save-all C-m
sleep 10s
FILENAME=paper-$(date +%F_%H.%M)
sudo tar cf /home/pineman/$FILENAME.tar /home/pineman/paper
sudo chown $(id -un): /home/pineman/$FILENAME.tar
docker exec paper /usr/bin/tmux send-keys save-on C-m
