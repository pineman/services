docker exec paper-primos /usr/bin/tmux send-keys save-off C-m save-all C-m
sleep 10s
cd /home/pineman/code/proj/services/paper-primos
sudo chown -R pineman: server_mount
FILENAME=paper-primos-$(date +%F_%H.%M)
tar cf $FILENAME.tar server_mount
zstdmt -q --rm $FILENAME.tar
docker exec paper-primos /usr/bin/tmux send-keys save-on C-m
