#!/usr/bin/env bash

USERNAME="$(whoami)"

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
	cp -r ./configs/i3 ~/.config/
}

function rofisetup {
	cp -r ./configs/rofi ~/.config/
}

function alacrittysetup {
	cp -r ./configs/alacritty ~/.config/
}

function picomsetup {
	cp -r ./configs/picom ~/.config/
}

function neovimsetup {
	cp -r ./configs/nvim ~/.config/
}

function qtsetup {
	sudo bash -c "echo 'export QT_QPA_PLATFORMTHEME=qt5ct' >> /etc/environment"
	cp -r ./configs/qt5ct ~/.config/
}

function networksetup {
	echo "find you ip link name:"
	ip link
	echo
	read -p "ENTER YOUR IP LINK: " LINK
	echo

	sudo systemctl disable dhcp -rcd.service
	sudo systemctl stop dhcp -rcd.service
	sudo ip link set dev "$(LINK)" down
	sudo systemctl enable NetworkManager.service
	sudo systemctl start NetworkManager.service
	sudo ip link set dev "$(LINK)" up
	echo "Might wanna reboot now with < $ reboot >"
}

function aliasessetup {
	cp -r ./configs/.aliases ~/
	echo "source ~/.aliases" >> ~/.bashrc
	echo "source ~/.aliases" >> ~/.zshrc
}

function xinitsetup {
	cp ./configs/.xinitrc ~/
}

function autologin {
	echo -e '[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx' >> ~/.profile
	sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
	sudo echo -e "[Service] \nExecStart=\nExecStart=-/usr/bin/agetty --autologin $USERNAME --noclear %I 38400 linux" > /etc/systemd/system/getty@tty1.service.d/autologin.conf
	echo "source ~/.profile"
	if [[ -f ~/.bash_profile ]]; then
		echo "source ~/.profile" >> ~/.bash_profile
	fi
}


aliasessetup
xinitsetup
#dmconfig
i3setup
rofisetup
alacrittysetup
picomsetup
neovimsetup
qtsetup
networksetup
autologin


echo "Done!"
echo 

