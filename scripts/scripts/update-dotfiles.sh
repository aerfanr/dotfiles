#!/bin/bash


DOTFILES_PATH=~/temp/dotfiless

cd $DOTFILES_PATH
echo HI
pwd

cd $DOTFILES_PATH || ( echo "Unable to cd to $DOTFILES_PATH" && exit )

echo "Updating dotfiles..."

cp -r ~/.config/nvim ./.config/nvim

cp -r ~/.config/fish ./.config/fish

cp -r ~/.config/hyprland ./.config/hyprland
cp -r ~/.config/waybar ./.config/waybar

cp -r ~/scripts ./

echo "Done! Commit stuff manually please..."
