I got lazy so this was generated using Claudeand edited a bit for now:

# Fish Shell Configuration
A Fish shell configuration with dynamic theme management, project organization utilities, and system accent color synchronization.

## Features
### Dynamic Theme Management
- **Automatic System Accent Synchronization**: Watches for system accent color changes and automatically updates your shell theme and prompt
- **Fish Theme Engine**: Generate and manage color palettes based on system settings or custom accent colors
- **Oh My Posh Integration**: Automatically syncs Oh My Posh themes with your system accent color
- **Real-time Theme Watching**: Background process monitors accent color changes and updates themes without restarting the shell

### Project Management
The `proj` command provides a streamlined project management system:
- **Open Projects**: `proj open <domain> <project_name>` - Navigate to a project directory
- **Create Projects**: `proj new <domain> <project_name>` - Create a new project directory
- **Add Git Repositories**: `proj add <domain> <git-clone-url>` - Clone and organize a git repositories
- **Find Projects**: `proj find <domain> <search_term>` - Search for existing projects
- **Delete Projects**: `proj delete <domain> <project_name>` - Remove project directories
- **Edit Configuration**: `proj edit <domain> <project_name>` - Open a project in your default editor

### Environment Setup
- **Neovim Integration**: Configures Neovim as the default editor (EDITOR, SUDO_EDITOR)
- **Rust Support**: Automatic Cargo environment setup
- **Mathematica Support**: WSTP compiler configuration for non-standard installations
- **Enhanced Resource Limits**: Increased file descriptor limit (65536) for development work

## Installation & Setup
### Prerequisites
- Fish shell (latest version recommended)
- Neovim
- Oh My Posh
- Git
- Rust & Cargo (optional, for Rust development)

### Configuration Files
#### `secrets.fish`
Store sensitive environment variables here (automatically gitignored):
```fish
set -x YOUR_SECRET_VAR "value"
set -x API_KEY "your_api_key"
```

#### `config.fish`
Main configuration entry point. Customize paths, add aliases, or modify startup behavior here.

## Key Functions
### Theme & Appearance
- `fish_theme_watch` - Monitor system accent color changes (auto-starts)
- `fish_theme_watch_stop` - Stop the theme watcher
- `system_theme_sync` - Manually sync all themes with system accent
- `get_system_accent_color` - Get current system accent color
- `fish_theme_from_system_accent` - Generate Fish theme from accent color
- `generate_fish_palette` - Create custom color palettes

### Color Utilities
- `adjust_lightness` - Lighten or darken colors
- `adjust_saturation` - Increase or decrease color saturation
- `rotate_hue` - Rotate color hue values
- `get_luminosity` - Calculate color luminosity
- `get_font_color` - Get optimal font color for a background

### Shortcuts
- `fishconf` - Edit Fish configuration
- `nvimconf` - Edit Neovim configuration

### Utilities
- `rust_repl` - Launch Rust REPL (mapping to `evcxr` because who in the world can remember that name?)
- `dex` / `ddo` / `dlogs` / `dup` - Docker utilities
- `b` - Mapping to `bun`

## Troubleshooting
### Theme Watcher Not Starting
Check if it's already running:
```fish
echo $__fish_theme_watch_pid
```

Stop and restart:
```fish
fish_theme_watch_stop
fish_theme_watch
```

## Environment Variables
- `PATH` - Extended with Neovim binary location
- `EDITOR` - Set to Neovim
- `SUDO_EDITOR` - Set to Neovim
- `WSTP_COMPILER_ADDITIONS_DIRECTORY` - Only applicable to me (Used for non standard wolfram installations)
