#!/bin/sh

sleep 1500 && ./notif-sound.sh && zenity --warning --text="25 minutes passed"
sleep 300 && ./notif-sound.sh && zenity --warning --text="5 minutes passed"
