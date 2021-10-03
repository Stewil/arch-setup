#!/usr/bin/env bash

PKGS=(
	'base-devel'
	'git'
)

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	sudo pacman -S "$PKG" --noconfirm --needed
done

function yaysetup {
	cd /opt
	sudo git clone https://aur.archlinux.org/yay.git
	sudo chown -R $USER:$USER ./yay
	cd - && cd /opt/yay 
	makepkg -si
	cd -
}

yaysetup

echo "Done!"
echo 
