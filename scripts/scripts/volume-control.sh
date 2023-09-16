#!/bin/bash

increase () {
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1
}

decrease () {
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- --limit 1
}

notify () {
	dunstify -h string:x-dunst-stack-tag:volume-control \
		-u low -t 1000 -i audio-volume-high -a "volume-control" \
		"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
}

toggle_mute () {
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
}

case $1 in
	"+") increase ; notify;;
	"-") decrease ; notify;;
	"m") toggle_mute ; notify;;
esac
