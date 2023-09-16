function ytplay
	youtube-dl -o - "$argv[1]" | mpv -
end
