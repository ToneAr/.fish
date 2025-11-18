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
	set omp_theme_clone_url git@github.com:ToneAr/TONE-oh-my-posh-theme.git
	set omp_config_dir $HOME/.poshthemes/
	begin
		git clone \
			$omp_theme_clone_url \
			$script_dir/repos/tone-omp-theme \
			--single-branch
	end &> /dev/null
	set clone_exit_code $status
	if test -n "$script_dir/repos/tone-omp-theme"; and test $clone_exit_code -eq 0
		cp -f \
			$script_dir/repos/tone-omp-theme/tone.omp.json \
			$omp_config_dir/tone.omp.json
	end
	if test -f "$omp_config_dir/tone.omp.json"
		begin
			oh-my-posh init fish \
				--config $omp_config_dir/tone.omp.json \
				| source
		end &> /dev/null
	else
		set_color red
		echo -e "Oh My Posh theme not found: $omp_config_dir/tone.omp.json"
		set_color normal
	end
end

function _proj_setup
	set proj_clone_url git@github.com:ToneAr/proj-cli.git
	begin
		git clone $proj_clone_url $script_dir/repos/proj-cli/ --single-branch
	end &> /dev/null
	set clone_exit_code $status
	if test -n "$script_dir/repos/proj-cli/"; and test $clone_exit_code -eq 0
		cp -f \
			$script_dir/repos/proj-cli/proj.fish \
			$script_dir/functions/proj.fish
		source $script_dir/functions/proj.fish
	else
		if not test -f "$script_dir/functions/proj.fish"
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

