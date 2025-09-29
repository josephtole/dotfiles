#!/usr/bin/env bash
# attach to first detached session, else create new one

s=$(tmux ls -F '#S #{session_attached}' 2>/dev/null | awk '$2==0{print $1; exit}')

if [ -n "$s" ]; then
  exec tmux attach -t "$s"
else
  exec tmux new
fi

