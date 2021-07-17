#!/bin/bash
set -euxo pipefail
tmux new-session -d java -jar /paper-1.17.1-110.jar
tail -F -n +1 logs/latest.log
