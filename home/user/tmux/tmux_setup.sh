#!/usr/bin/env bash

set -euo pipefail

session_name="default"
workspace="$HOME/Workspace/github.com/YukihiroArakawa"

if ! tmux has-session -t "$session_name" 2>/dev/null; then
  tmux new-session -d -s "$session_name" -n "os-conf" -c "$workspace/nixos-config"
  tmux split-window -h -p 30 -t "$session_name:0" -c "$workspace/nixos-config"
  tmux send-keys -t "$session_name:0.0" "nvim ." C-m

  tmux new-window -t "$session_name:1" -n "blogs" -c "$workspace/yukiotechblog"

  tmux new-window -t "$session_name:2" -n "blog-watcher" -c "$workspace/blog-watcher/"

  tmux select-window -t "$session_name:0"
fi

exec tmux attach-session -t "$session_name"
