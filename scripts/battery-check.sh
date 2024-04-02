#!/bin/bash

batt=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$batt" -lt 6 ]; then
	dunstify -h string:x-dunst-stack-tag:battery-control \
		-u critical -a "battery-control" \
		"MAYHEM WILL FALL!!!"
fi
