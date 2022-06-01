#!/bin/bash
set -euxo pipefail

build() {
  docker-compose --profile push build --no-cache $1 $1-latest
  docker-compose --profile push push $1 $1-latest
}

start() {
  docker-compose pull -q
  docker-compose up -d paper factorio
}

server-create() {
  hcloud ssh-key create --name pineman --public-key-from-file ~/.ssh/id_ed25519.pub
  hcloud server create --name pinecone --type cx11 --image rocky-8 --ssh-key pineman --location nbg1
  IP=$(hcloud server list | grep pinecone | awk '{ print $4 }')
  while :; do
    ssh -o StrictHostKeyChecking=accept-new root@$IP exit 0 && break
    sleep 5
  done
  ssh root@$IP <<EOF
	dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
	dnf install -y docker-ce docker-ce-cli docker-compose-plugin
	systemctl enable docker --now
	# clone repo
	# run script inside to get b2 artifacts (save games)
	# TODO: rebuild images and push so this works:
	docker-compose up -d --no-build --quiet-pull 
EOF
}

server-delete() {
  IP=$(hcloud server list | grep pinecone | awk '{ print $4 }')
  ssh root@$IP <<EOF
    docker-compose down
    # run script to upload b2 artifacts (save games)
EOF
  hcloud server delete $(hcloud server list | grep pinecone | awk '{ print $1 }')
  hcloud ssh-key delete pineman
}

"$@"
