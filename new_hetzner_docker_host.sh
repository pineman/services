#!/usr/bin/env bash
set -euxo pipefail

NAME=services
IP=$(hcloud server list | grep $NAME | awk '{ print $4 }' || true)
if [[ -z $IP ]]; then
  hcloud server create --name $NAME --type cx22 --image docker-ce --ssh-key pineman --location nbg1
fi
IP=$(hcloud server list | grep $NAME | awk '{ print $4 }' || true)
while :; do
  ssh -T -o StrictHostKeyChecking=accept-new root@"$IP" exit 0 && break &>/dev/null
  sleep 5
done
echo 'run export DOCKER_HOST=tcp://localhost:9999'
ssh root@"$IP" -N -L 9999:/run/docker.sock
