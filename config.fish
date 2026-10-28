# @fish-lsp-disable 1004
# Extra tool locations, added only where they exist
for dir in /opt/nvim-linux-x86_64/bin $HOME/buildmonitor-cli $HOME/.opencode/bin
	test -d $dir; and fish_add_path --global --append $dir
end

# Set nvim as default editor
set -x SUDO_EDITOR (command -s nvim; or echo vi)
set -x EDITOR "code"

if test (uname) = Linux
	set -x QT_WAYLAND_SHELL_INTEGRATION "xdg-shell"
end

# WSTP fix for non-standard installation directory
if set -q MATHEMATICA_HOME
	set -l wstp_platform Linux-x86-64
	switch (uname)-(uname -m)
		case Darwin-arm64
			set wstp_platform MacOSX-ARM64
		case Darwin-\*
			set wstp_platform MacOSX-x86-64
	end
	set -x WSTP_COMPILER_ADDITIONS_DIRECTORY "$MATHEMATICA_HOME/SystemFiles/Links/WSTP/DeveloperKit/$wstp_platform/CompilerAdditions"
	set -x WSTP_DIR $WSTP_COMPILER_ADDITIONS_DIRECTORY
end

# Source secrets
set script_dir (path dirname (path resolve (status --current-filename)))
test -f $script_dir/secrets.fish; and source $script_dir/secrets.fish

# Increase descriptor limit (macOS caps this below 65536, so fall back to the hard limit)
ulimit -n 65536 2>/dev/null; or ulimit -n (ulimit -Hn) 2>/dev/null

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
