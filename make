#!/bin/bash
set -euxo pipefail

start() {
  docker-compose pull -q
  docker-compose up -d ingress homepage abra factorio transmission grafana
}

"$@"
