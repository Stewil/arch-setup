#!/usr/bin/env bash

PKGS=(
	'zsh'
	'alacritty'
	'curl'
	'wget'
	'neofetch'
	'neovim'
	'unrar'
	'zsh-completions'
	'zip'
	'unzip'
	'htop'
	'clang'
	'cmake'
	'gcc'
	'glibc'
	'gimp'
)

YAYPKGS=(
	'neovim-plug'
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
