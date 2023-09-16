#!/bin/bash


DOTFILES_PATH=~/temp/dotfiles

cd $DOTFILES_PATH || exit

echo "Updating dotfiles..."

cp -r ~/.config/nvim ./.config/nvim

cp -r ~/.config/fish ./.config/fish

cp -r ~/.config/hypr ./.config/hypr
cp -r ~/.config/waybar ./.config/waybar

cp -r ~/scripts ./

echo "Done! Commit stuff manually please..."
