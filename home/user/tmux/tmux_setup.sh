#!/usr/bin/env bash

set -euo pipefail

session_name="default"
workspace="$HOME/Workspace/nixos-config"

if ! tmux has-session -t "$session_name" 2>/dev/null; then
  tmux new-session -d -s "$session_name" -c "$workspace"
  tmux split-window -h -t "$session_name:0" -c "$workspace"
fi

exec tmux attach-session -t "$session_name"
