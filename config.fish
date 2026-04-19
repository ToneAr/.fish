# @fish-lsp-disable 1004
# Set nvim as default editor
set -x PATH "$PATH:/opt/nvim-linux-x86_64/bin:/home/tonya/buildmonitor-cli/"
set -x SUDO_EDITOR "/opt/nvim-linux-x86_64/bin/nvim"
set -x EDITOR "code"
set -x QT_WAYLAND_SHELL_INTEGRATION "xdg-shell"

# WSTP fix for non-standard installation directory
set -x WSTP_COMPILER_ADDITIONS_DIRECTORY "$MATHEMATICA_HOME/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions"
set -x WSTP_DIR $WSTP_COMPILER_ADDITIONS_DIRECTORY

# opencode
set -x PATH "$PATH:/home/tonya/.opencode/bin"

# Source secrets
set script_dir (dirname (status --current-filename))
source $script_dir/secrets.fish

# Increase descriptor limit
ulimit -n 65536

# Interactive shell setup
if status is-interactive
	# Proj function setup
	proj_setup

	# Oh my posh setup
	omp_setup

	# Sync all themes with system accent
	system_theme_sync

	# Start watching for accent color changes
	fish_theme_watch
end

