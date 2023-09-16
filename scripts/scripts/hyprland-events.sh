handle() {
	local line="$1"

	if [[ ${line:0:12} == "activelayout" ]]; then
		declare -a arr=(${line//,/ })
		dunstify -h string:x-dunst-stack-tag:keyboard\
			-u low -t 1000 -a "keyboard" \
			"$(echo ${arr[@]:1})"
	fi
}

socat - "UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" |
	while read -r line;
	do handle "$line";
	done
