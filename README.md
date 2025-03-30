# tmux-pane-preview

A tmux plugin that allows you to view your current pane's content in Neovim. This is useful for examining output, copying text, or searching through your terminal's history with Neovim's powerful navigation capabilities.

## Features

- View the full history of your current tmux pane in Neovim
- Clean and minimal Neovim interface (no status line or command display)
- Automatically returns to your original window when you exit Neovim
- Handles cleanup of temporary files
- Customizable key binding

## How It Works

This plugin:

1. Captures the current pane's content (including history)
2. Opens it in Neovim in a new window named "HISTORY"
3. When you exit Neovim, automatically returns to your original window
4. Cleans up temporary files

## Installation

### Using [TPM](https://github.com/tmux-plugins/tpm) (Tmux Plugin Manager)

Add this line to your `~/.tmux.conf`:

```
set -g @plugin 'merkksgit/tmux-pane-preview'
```

Then press `prefix + I` to install the plugin.

## Usage

Press `prefix + å` (or your custom key binding) to open the current pane's content in Neovim.

When you're done, simply exit Neovim (`:q`) and you'll automatically return to your original window.

## Configuration

You can customize the plugin by adding these lines to your `~/.tmux.conf`:

```
# Change the key binding (default is 'å')
set -g @preview-key 'å'
```

Make sure to add this configuration line before the plugin definition in your tmux.conf.

## Requirements

- tmux 2.1 or later
- Neovim
