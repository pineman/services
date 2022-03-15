#!/bin/bash
set -euxo pipefail

start() {
  docker-compose up -d ingress homepage abra factorio transmission grafana
}

"$@"
