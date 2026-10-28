# Put Homebrew on PATH (Apple Silicon, then Intel Macs)
for brew in /opt/homebrew/bin/brew /usr/local/bin/brew
	if test -x $brew
		$brew shellenv fish | source
		break
	end
end
