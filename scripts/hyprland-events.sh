handle() {
	local line="$1"

	if [[ ${line:0:12} == "activelayout" ]]; then
		line=${line//,/ }
		line=${line//>/ }
		arr=(${line})

		# Notify keyboard layout change
		dunstify -h string:x-dunst-stack-tag:keyboard\
			-u low -t 1000 -a "keyboard" \
			"$(echo ${arr[@]:2})"

		# Apply keyboard layout locks
		if [ ! -f /tmp/keyboard_layouts_unlocked ]; then
			echo hi
			if [[ ${arr[@]:2} == "Turkish" ]]; then
				hyprctl switchxkblayout ${arr[1]} next
			fi
		fi
	fi
}

socat -U - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" |
	while read -r line;
	do handle "$line";
	done
