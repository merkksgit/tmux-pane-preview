#!/usr/bin/env bash

set -e

set -o pipefail

# Create temporary file for captured content

TMPFILE=$(mktemp).out

# Capture pane content using your working method

tmux capture-pane -J -p -S - -E - > "$TMPFILE"

# Save current window/session information

CURRENT_SESSION=$(tmux display-message -p '#{session_name}')

CURRENT_WINDOW=$(tmux display-message -p '#{window_id}')

# Create a new window with a distinct name for easy reference

tmux new-window -n "PREVIEW" "nvim -R -c 'norm G' -c 'set laststatus=0' -c 'set noshowcmd' -c 'set noruler' -c 'set noshowmode' -c 'set cmdheight=0' \"$TMPFILE\"; tmux select-window -t \"$CURRENT_WINDOW\"; rm -f \"$TMPFILE\""
