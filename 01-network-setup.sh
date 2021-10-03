#!/usr/bin/env bash

PKGS=(
	'networkmanager'
)

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	sudo pacman -S "$PKG" --noconfirm --needed
done

echo "Done!"
echo 
