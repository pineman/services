#!/bin/bash
set -euxo pipefail

# setup: zfs (obv), b2-linux curl and login, .mailrc gmail config
\fd -I -H '.DS_Store' /home/pineman/Documents -x rm
\fd -I -H --glob '._*' /home/pineman/Documents -x rm
last_recv=$(zfs list -H -o name -t snapshot -s creation hdd | tail -n 1 | cut -d'@' -f2)
new=$(date +%s | md5sum | cut -c1-8)
docker exec paper /usr/bin/tmux send-keys save-off C-m save-all C-m || true
sleep 10s
zfs snapshot -r ssd@$new
docker exec paper /usr/bin/tmux send-keys save-on C-m || true
zfs send -R -I $last_recv ssd@$new | zfs recv -Fdu hdd
b2-linux sync --noProgress --keepDays 30 --threads 8 --replaceNewer /home/pineman/Documents/.zfs/snapshot/$new b2://pineman-Documents
zpool status; zpool list
mailx -s 'pinecone backup' joao.castropinheiro@gmail.com <<< $(journalctl _SYSTEMD_INVOCATION_ID=$(systemctl show -P InvocationID backup))
