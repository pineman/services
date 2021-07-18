#!/bin/bash
set -euxo pipefail
VERSION=1.0.0
docker build -t registry.gitlab.com/pineman/services/base:$VERSION .
docker push -a registry.gitlab.com/pineman/services/base
