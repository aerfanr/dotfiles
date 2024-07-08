dunstify "Layout lock toggeled"

if [ -f /tmp/keyboard_layouts_unlocked ]; then
	rm /tmp/keyboard_layouts_unlocked
else
	touch /tmp/keyboard_layouts_unlocked
fi
