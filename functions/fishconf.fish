function fishconf
	# Resolve through the functions/ symlink so this opens the git checkout
	# on NixOS too, where ~/.config/fish/functions points into it.
	cd (dirname (realpath (status --current-filename)))/..
	$EDITOR .
end
