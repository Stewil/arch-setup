#!/usr/bin/env bash

PKGS=(
	'picom'
	'i3-gaps'
	'i3status'
	'i3-blocks'
	'dunst'
	'rofi'
	'dolphin'
	'spectacle'
	'qt5ct'
	'nitrogen'
	'arandr'
	'noto-fonts-cjk'
	'noto-fonts-emoji'
	'noto-fonts'
)

YAYPKGS=(
	'ttf-font-awesome'
	'breeze'
)

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	sudo pacman -S "$PKG" --noconfirm --needed
done

for PKG in "${YAYPKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	yay -Sy "$PKG" --noconfirm --needed
done

echo "Done!"
echo 
