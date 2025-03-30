#!/usr/bin/env bash
set -e
set -o pipefail
TMPFILE=$(mktemp).out
NVIM_OUTPUT_FILE=$(mktemp).out

# -J: join lines, removes soft wraps
# -p: output to stdout
# -S: start at the beginning of the history
# -E: capture until the end of visible content (avoids excess blank lines)
tmux capture-pane -J -p -S - -E - > "$TMPFILE"

# -P: print window id
# -d: open window in the background
# -R: read-only mode
WINDOW_ID=$(tmux new-window -P -d "NVIM_OUTPUT_FILE=$NVIM_OUTPUT_FILE nvim -R -c 'norm G' -c 'set laststatus=0' -c 'set noshowcmd' -c 'set noruler' -c 'set noshowmode' -c 'set cmdheight=0' $TMPFILE")
CURRENT_WINDOW_ID=$(tmux display-message -p '#{window_id}')
tmux swap-pane -s "$WINDOW_ID" -t "$CURRENT_WINDOW_ID"

# remain on exit makes it so that "pane-died" is triggered when the pane exits
tmux set-window-option -t "$CURRENT_WINDOW_ID" remain-on-exit on

# Fixed hook - each command is separate to avoid parsing issues
tmux set-hook pane-died "run-shell 'tmux swap-pane -s \"$CURRENT_WINDOW_ID\" -t \"$WINDOW_ID\" || true'"
tmux set-hook -a pane-died "run-shell 'tmux kill-window -t \"$WINDOW_ID\" || true'"
tmux set-hook -a pane-died "run-shell 'tmux set-hook -u pane-died || true'"
tmux set-hook -a pane-died "run-shell 'tmux set-window-option -t \"$CURRENT_WINDOW_ID\" remain-on-exit off || true'"
tmux set-hook -a pane-died "run-shell 'tmux respawn-pane -k -t \"$CURRENT_WINDOW_ID\" || true'"
