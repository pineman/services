#!/bin/bash
set -euxo pipefail

# Configuration
BACKUP_ROOT="/root/backups"
KEEP_LATEST_COUNT=2

cleanup_old_backups() {
  SESSION=$1
  
  mapfile -t all_backups < <(ls -t "$BACKUP_ROOT"/"$SESSION"-*.tar.zst 2>/dev/null || true)
  
  if [ ${#all_backups[@]} -le $KEEP_LATEST_COUNT ]; then
    return
  fi
  
  # Keep the latest N backups unconditionally
  declare -A keep_files
  for ((i=0; i<KEEP_LATEST_COUNT && i<${#all_backups[@]}; i++)); do
    keep_files["${all_backups[$i]}"]=1
  done
  
  # For older backups, keep one per month (the oldest from each month)
  declare -A monthly_backups
  for ((i=KEEP_LATEST_COUNT; i<${#all_backups[@]}; i++)); do
    backup_file="${all_backups[$i]}"
    if [[ $(basename "$backup_file") =~ -([0-9]{4}-[0-9]{2})-[0-9]{2}_ ]]; then
      year_month="${BASH_REMATCH[1]}"
      monthly_backups[$year_month]="$backup_file"
    fi
  done
  
  for backup_file in "${monthly_backups[@]}"; do
    keep_files["$backup_file"]=1
  done
  
  for backup_file in "${all_backups[@]}"; do
    if [[ -z "${keep_files[$backup_file]+x}" ]]; then
      echo "Deleting old backup: $backup_file"
      rm -- "$backup_file"
    fi
  done
}

backup_server() {
  SESSION=$1
  SERVER_DIR=$2

  if ! tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session $SESSION not found, skipping backup."
    return
  fi

  FILENAME="${SESSION}-$(date +%F_%H.%M)"
  tmux send-keys -t "$SESSION" save-off C-m save-all C-m
  sleep 10s
  mkdir -p $BACKUP_ROOT
  cd "$(dirname "$SERVER_DIR")"
  tar cf "$BACKUP_ROOT/$FILENAME.tar" "$(basename "$SERVER_DIR")"
  zstdmt -q --rm "$BACKUP_ROOT/$FILENAME.tar"
  tmux send-keys -t "$SESSION" save-on C-m
  cleanup_old_backups "$SESSION"
}

backup_server "neoforge" "/root/neoforge"
backup_server "paper" "/root/paper"
