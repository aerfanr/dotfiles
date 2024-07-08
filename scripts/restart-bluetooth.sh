#!/bin/sh

systemctl --user restart pipewire
systemctl restart bluetooth
systemctl --user restart blueman-manager
