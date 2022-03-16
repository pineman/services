#!/bin/bash
set -euxo pipefail

pull() {
  docker-compose pull -q
}

start() {
  docker-compose up -d traefik homepage abra ju factorio transmission grafana
}

build() {
  docker-compose --profile push build --no-cache $1 $1-latest
}

push() {
  docker-compose --profile push push $1 $1-latest
}

"$@"
