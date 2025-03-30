#!/usr/bin/env bash
# tmux-preview.tmux - Plugin for viewing pane content in Neovim

# Get the current directory where this script is located
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Default key binding (can be overridden by user)
default_key="P"

# Source the script with the main functionality
preview_cmd="$CURRENT_DIR/scripts/preview.sh"

# Helper function to get tmux option
get_tmux_option() {
    local option=$1
    local default_value=$2
    local option_value=$(tmux show-option -gqv "$option")
    if [ -z "$option_value" ]; then
        echo "$default_value"
    else
        echo "$option_value"
    fi
}

# Read user-configurable options
key_binding=$(get_tmux_option "@preview-key" "$default_key")

# Set up the key binding
tmux bind-key "$key_binding" run-shell "$preview_cmd"

# Print a message to confirm the plugin is loaded
tmux display-message "Tmux Preview Plugin loaded"
