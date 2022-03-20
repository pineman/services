#!/bin/bash
set -euxo pipefail

build() {
  docker-compose --profile push build --no-cache $1 $1-latest
  docker-compose --profile push push $1 $1-latest
}

start() {
  docker-compose pull -q
  docker-compose up -d traefik homepage abra ju factorio transmission grafana paper
}

"$@"
