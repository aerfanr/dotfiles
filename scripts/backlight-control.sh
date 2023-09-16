#!/bin/bash

increase () {
	brightnessctl set 5%+
}

decrease () {
	brightnessctl set 5%-
}

notify () {
	current=$(brightnessctl get)
	max=$(brightnessctl max)
	echo $current
	dunstify -h string:x-dunst-stack-tag:backlight-control \
		-u low -t 1000 -a "backlight-control" \
		"Brightness: $((current*100/max))%"
}

case $1 in
	"+") increase ; notify;;
	"-") decrease ; notify;;
esac
