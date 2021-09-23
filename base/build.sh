#!/bin/bash
set -euxo pipefail
VERSION=1.3.0
docker build --no-cache -t registry.gitlab.com/pineman/services/base:$VERSION .
docker tag registry.gitlab.com/pineman/services/base:$VERSION registry.gitlab.com/pineman/services/base:latest
docker push -a registry.gitlab.com/pineman/services/base
