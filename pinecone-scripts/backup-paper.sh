docker exec paper /usr/bin/tmux send-keys save-off C-m save-all C-m
sleep 10s
docker run --volumes-from paper -v $(pwd):/backup ubuntu:20.04 tar cf /backup/paper-$(date +%F_%H.%M).tar /paper
sudo chown $(id -un): *.tar
docker exec paper /usr/bin/tmux send-keys save-on C-m
