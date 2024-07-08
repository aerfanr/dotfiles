#!/bin/sh


DOTFILES_PATH=~/temp/dotfiles

cd $DOTFILES_PATH || exit

echo "Updating dotfiles..."

cp -r ~/.config/nvim ./.config/nvim

cp -r ~/.config/fish ./.config/fish

cp -r ~/.config/hypr ./.config/hypr
cp -r ~/.config/waybar ./.config/waybar
cp -r ~/.config/btop ./.config/btop

cp -r ~/scripts ./

mkdir -p ./root-etc/nixos/custom
cp /etc/nixos/configuration.nix ./root-etc/nixos/
cp -r /etc/nixos/custom ./root-etc/nixos/custom

echo "Done! Commit stuff manually please..."
