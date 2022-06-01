#!/bin/bash
set -euxo pipefail
VERSION=1.3.2
docker build --no-cache -t registry.gitlab.com/pineman/services/base:$VERSION .
docker tag registry.gitlab.com/pineman/services/base:$VERSION registry.gitlab.com/pineman/services/base:latest
docker push registry.gitlab.com/pineman/services/base:$VERSION
docker push registry.gitlab.com/pineman/services/base:latest
