#!/bin/bash
poweroff() {
	local answer=$(kdialog --radiolist 'What are you going to do?' \
		'shutdown' 'Shutdown' on \
		'reboot' 'Reboot' off \
		'suspend' 'Suspend' off \
		'exit' 'Exit Hyprland' off \
		'cancel' 'Cancel' off)

	case $answer in
		'shutdown')
			sleep 1; shutdown now ;;
		'reboot')
			sleep 1; reboot ;;
		'suspend')
			sleep 1; swaylock -f && systemctl suspend;;
		'exit')
			sleep 1; hyprctl dispatch exit ;;
		*)
			exit ;;
	esac
}

case $1 in
	'poweroff')
		poweroff ;;
	*)
		exit ;;
esac
