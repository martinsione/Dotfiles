#!/bin/sh

get_user_and_pass() {
	name=$(dialog --inputbox "First, please enter a name for the user account." 10 60 3>&1 1>&2 2>&3 3>&1) || exit 1
	while ! echo "$name" | grep -q "^[a-z_][a-z0-9_-]*$"; do
		name=$(dialog --no-cancel --inputbox "Username not valid. Give a username beginning with a letter, with only lowercase letters, - or _." 10 60 3>&1 1>&2 2>&3 3>&1)
	done
	pass1=$(dialog --no-cancel --passwordbox "Enter a password for that user." 10 60 3>&1 1>&2 2>&3 3>&1)
	pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
	while ! [ "$pass1" = "$pass2" ]; do
		unset pass2
		pass1=$(dialog --no-cancel --passwordbox "Passwords do not match.\\n\\nEnter password again." 10 60 3>&1 1>&2 2>&3 3>&1)
		pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
	done ;}

adduserandpass() {
	dialog --infobox "Adding user \"$name\"..." 4 50
	useradd -mg wheel "$name" >/dev/null 2>&1 ||
	usermod -aG wheel,audio,video,optical,storage,libvirt "$name"
	echo "$name:$pass1" | chpasswd
	unset pass1 pass2 ;}

get_user_and_pass
get_mail
adduserandpass
pacman -S sudo
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers
su -l $name