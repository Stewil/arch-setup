#!/usr/bin/env bash

PKGS=(
	'alsa-utils'
	'alsa-plugins'
	'pulseaudio'
	'pulseaudio-alsa'
	'pavucontrol'
)

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	sudo pacman -S "$PKG" --noconfirm --needed
done

echo "Done!"
echo 
