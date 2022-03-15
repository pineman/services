#!/bin/bash
set -euxo pipefail

# setup: zfs (obv), b2-linux curl and login, .mailrc gmail config
last_recv=$(zfs list -H -o name -t snapshot -s creation hdd | tail -n 1 | cut -d'@' -f2)
new=$(date +%s | md5sum | cut -c1-8)
docker exec paper /usr/bin/tmux send-keys save-off C-m save-all C-m || true
sleep 10s
zfs snapshot -r ssd@$new
docker exec paper /usr/bin/tmux send-keys save-on C-m || true
zfs send -R -I $last_recv ssd@$new | zfs recv -Fdu hdd
zpool status; zpool list
mailx -s 'pinecone backup' joao.castropinheiro@gmail.com <<< $(journalctl _SYSTEMD_INVOCATION_ID=$(systemctl show -P InvocationID backup))
