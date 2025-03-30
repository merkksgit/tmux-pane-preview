# tmux-pane-preview

A tmux plugin that allows you to view the current pane's content in Neovim. This is useful for examining output, copying text, or searching through your terminal's history with Neovim's powerful navigation capabilities.

## Features

- View the entire history of your current tmux pane in Neovim
- Clean and minimal Neovim interface (no status line or command display)
- Automatically returns to your original pane when you exit Neovim
- Handles cleanup of temporary files
- Customizable key binding

## How It Works

This plugin:

1. Captures the current pane's content (including history)
2. Opens it in Neovim in a separate window
3. Swaps the Neovim window with your current pane
4. Returns you to your original pane when you exit Neovim

## Installation

### Using [TPM](https://github.com/tmux-plugins/tpm) (Tmux Plugin Manager)

Add this line to your `~/.tmux.conf`:

```
set -g @plugin 'merkksgit/tmux-pane-preview'
```

Then press `prefix + I` to install the plugin.

### Manual Installation

Clone the repository:

```bash
git clone https://github.com/merkksgit/tmux-pane-preview ~/.tmux/plugins/tmux-pane-preview
```

Add this line to your `~/.tmux.conf`:

```
run-shell ~/.tmux/plugins/tmux-pane-preview/tmux-pane-preview.tmux
```

Reload tmux configuration:

```bash
tmux source-file ~/.tmux.conf
```

### Standalone Usage

If you prefer not to install as a plugin, you can:

1. Save the script to a file (e.g., `~/.local/bin/tmux-preview.sh`)
2. Make it executable: `chmod +x ~/.local/bin/tmux-preview.sh`
3. Add a key binding in your tmux config:
   ```
   bind-key P run-shell "~/.local/bin/tmux-preview.sh"
   ```

## Usage

Press `prefix + P` (or your custom key binding) to open the current pane's content in Neovim.

When you're done, simply exit Neovim (`:q`) to return to your original pane.

## Configuration

You can customize the plugin by adding these lines to your `~/.tmux.conf`:

```
# Change the key binding (default is 'P')
set -g @preview-key 'z'
```

## Requirements

- tmux 2.1 or later
- Neovim

## Troubleshooting

If you experience any issues:

- Make sure Neovim is installed and in your PATH
- Check that you're running a recent version of tmux
- If the captured content is empty, try running the script directly to see any error messages

## License

[MIT](LICENSE)
