function ytrec
	youtube-dl -o "$argv[2]" -o - "$argv[1]" | mpv -
end
