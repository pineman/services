#!/bin/bash
set -euxo pipefail
curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
install_clean nodejs zip
