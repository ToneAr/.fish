function nixconf
	if test (uname) = Darwin
		cd /etc/nix-darwin
	else
		cd /etc/nixos
	end
	$EDITOR .
end
