#!/bin/bash
set -euxo pipefail
tmux new-session -d java -jar /paper*.jar
tail -F -n +1 logs/latest.log
