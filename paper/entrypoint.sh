#!/bin/bash
set -euxo pipefail
tmux new-session -d java -jar /paper-1.18.1-77.jar
tail -F -n +1 logs/latest.log
