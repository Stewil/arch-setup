#!/usr/bin/env bash

PKGS=(
)

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	sudo pacman -S "$PKG" --noconfirm --needed
done

function dmconfig {
	sudo systemctl disable lightdm && sudo systemctl enable sddm
	echo "Please restart desktop session to use SDDM"
}

function i3setup {
	cp ./configs/i3 ~/.config/
}

function alacrittysetup {
	cp ./configs/alacritty ~/.config/
}

function picomsetup {
	cp ./configs/picom ~/.config/
}

function neovimsetup {
	cp ./configs/nvim ~/.config/
}

function qtsetup {
	sudo bash -c "echo 'export QT_QPA_PLATFORMTHEME=qt5ct' >> /etc/environment"
	cp ./configs/qt5ct ~/.config/
}

function networksetup {
	echo "find you ip link name:"
	ip link
	echo
	read -p "ENTER YOUR IP LINK: " LINK
	echo

	sudo systemctl disable dhcpcd.service
	sudo systemctl stop dhcpcd.service
	sudo ip link set dev "$(LINK)" down
	sudo systemctl enable NetworkManager.service
	sudo systemctl start NetworkManager.service
	sudo ip link set dev "$(LINK)" up
	echo "Might wanna reboot now with < $ reboot >"
}

function aliasessetup {
	cp ./configs/.aliases ~/
	echo "source ~/.aliases" >> ~/.bashrc
	echo "source ~/.aliases" >> ~/.zshrc
}


aliasessetup
dmconfig
i3setup
alacrittysetup
picomsetup
neovimsetup
qtsetup
networksetup


echo "Done!"
echo 

