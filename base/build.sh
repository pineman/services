#!/bin/bash
set -euxo pipefail
VERSION=1.3.2
docker build --no-cache -t ghcr.io/pineman/services/base:$VERSION .
docker tag ghcr.io/pineman/services/base:$VERSION ghcr.io/pineman/services/base:latest
docker push ghcr.io/pineman/services/base:$VERSION
docker push ghcr.io/pineman/services/base:latest
