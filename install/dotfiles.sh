#!/bin/sh

aurhelper=paru

get_mail() {
	mail1=$(dialog --inputbox "Enter your email." 10 60 3>&1 1>&2 2>&3 3>&1)
	mail2=$(dialog --inputbox "Retype your email." 10 60 3>&1 1>&2 2>&3 3>&1)
	while ! [ "$mail1" = "$mail2" ]; do
		unset mail2
		mail1=$(dialog --inputbox "Mails do not match.\\n\\nEnter your email again." 10 60 3>&1 1>&2 2>&3 3>&1)
		mail2=$(dialog --inputbox "Retype your email." 10 60 3>&1 1>&2 2>&3 3>&1)
	done
  export email=$mail1 ;}

install_aur_helper() {
  cd /tmp
  curl -sO https://aur.archlinux.org/cgit/aur.git/snapshot/"$aurhelper".tar.gz
  tar -xvf "$aurhelper".tar.gz
  cd "$aurhelper"
  makepkg --noconfirm -si
  sudo rm -rf ../$aurhelper*
  cd ~
}

# Create user
su $name

# Install packages
sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort backup/arch/pac.list ))
install_aur_helper
$aurhelper -S --needed $(comm -12 <(yay -Slq | sort) <(sort backup/arch/aur.list ))

# Clone dotfiles repo
git clone https://github.com/martinsione/dotfiles.git ~/dotfiles

mkdir -p ~/.config/VSCodium/User ~/.local
cd ~/dotfiles
stow src

# Compile packages
for file in ~/.local/src/*; do cd "$file" && make && sudo make clean install; done

# Change shell to zsh
chsh -s $(which zsh)
source ~/.config/zsh/.zshrc

# Install git programs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Auto mount the hard drive
# echo 'UUID=0492de4e-821d-48d4-970f-7a7ccb869fe0	/mnt/storage	ext4		rw,relatime	0 2' | sudo tee -a /etc/fstab
echo 'export ZDOTDIR=$HOME/.config/zsh' | sudo tee -a /etc/zsh/zshenv

# Generate ssh keys
# ssh-keygen -t rsa -b 4096 -C "${email}"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa
