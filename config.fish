# @fish-lsp-disable 1004
# Set nvim as default editor
set -x PATH "$PATH:/opt/nvim-linux-x86_64/bin"
set -x SUDO_EDITOR "/opt/nvim-linux-x86_64/bin/nvim"
set -x EDITOR "/opt/nvim-linux-x86_64/bin/nvim"

# WSTP fix for non-standard installation directory
set -x WSTP_COMPILER_ADDITIONS_DIRECTORY "$MATHEMATICA_HOME/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions"

# Source secrets
set script_dir (dirname (status --current-filename))
source $script_dir/secrets.fish

# Increase descriptor limit
ulimit -n 65536

set -x CONFIG_CURL_TIMEOUT 1

# Utility functions
function _omp_setup
	set omp_theme_url https://raw.githubusercontent.com/ToneAr/TONE-oh-my-posh-theme/refs/heads/main/tone.omp.json
	set omp_config_dir $HOME/.poshthemes/
	set content "$(curl -m $CONFIG_CURL_TIMEOUT -s $omp_theme_url)"
	if test -n "$content"
		echo "$content" > $omp_config_dir/tone.omp.json
	end
	if test -f "$omp_config_dir/tone.omp.json"
		begin
			oh-my-posh init fish --config $omp_config_dir/tone.omp.json | source
		end &> /dev/null
	else
		set_color red
		echo -e "Oh My Posh theme not found: $omp_config_dir/tone.omp.json"
		set_color normal
	end
end

function _proj_setup
	set proj_def_url https://raw.githubusercontent.com/ToneAr/proj-cli/refs/heads/main/proj.fish
	set content "$(curl -m $CONFIG_CURL_TIMEOUT -s $proj_def_url)"
	if test -n "$content"
		echo "$content" > $script_dir/functions/proj.fish
		source $script_dir/functions/proj.fish
	else
		if test -f "$script_dir/functions/proj.fish"
			set_color red
			echo -e "Failed to update proj.fish"
			set_color normal
		else
			set_color red
			echo -e "Failed to fetch proj.fish"
			set_color normal
		end
	end
end

# Interactive shell setup
if status is-interactive
	_proj_setup
	_omp_setup
end

