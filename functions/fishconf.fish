function fishconf
	# Resolve through the functions/ symlink so this opens the git checkout
	# on NixOS too, where ~/.config/fish/functions points into it.
	cd (path dirname (path resolve (status --current-filename)))/..
	$EDITOR .
end
