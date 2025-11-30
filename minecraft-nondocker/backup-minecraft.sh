#!/bin/bash
set -euxo pipefail

# Configuration
BACKUP_ROOT="/root/backups"
KEEP_COUNT=2

backup_server() {
  SESSION=$1
  SERVER_DIR=$2
  FILENAME="${SESSION}-$(date +%F_%H.%M)"
  tmux send-keys -t "$SESSION" save-off C-m save-all C-m
  sleep 10s
  cd "$(dirname "$SERVER_DIR")"
  tar cf "$BACKUP_ROOT/$FILENAME.tar" "$(basename "$SERVER_DIR")"
  zstdmt -q --rm "$BACKUP_ROOT/$FILENAME.tar"
  tmux send-keys -t "$SESSION" save-on C-m
  ls -t "$BACKUP_ROOT"/"$SESSION"-*.tar.zst | tail -n +$((KEEP_COUNT + 1)) | xargs -r rm --
}

backup_server "neoforge" "/root/neoforge"
backup_server "paper" "/root/paper"
