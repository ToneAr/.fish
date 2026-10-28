function nixreload
	if test (uname) = Darwin
		sudo darwin-rebuild switch --flake /etc/nix-darwin
	else
		sudo nixos-rebuild switch --flake /etc/nixos
	end
end
