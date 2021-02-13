#!/bin/bash

hostname_and_pass() { \
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
	done
}

pacman -Sy --noconfirm dialog || { echo "Error at script start: Are you sure you're running this as the root user? Are you sure you have an internet connection?"; exit; }

dialog --defaultno --title "Welcome to Martin's Arch automated installation" --yesno "This is intended for personal use.\n\nTo stop this script, press no."  10 60 || exit

hostname_and_pass
export hostname=$name
export passwd=$pass1

dialog --no-cancel --inputbox "Enter the disk in which you want to install the system." 10 60 2> disk.tmp

timedatectl set-ntp true

# cat <<EOF | fdisk /dev/sda
# Set partition table to gpt
# Creates a new partition
# Enter
# Enter
# Select the size+550M
# Creates a new partition
# Enter
# Enter
# Enter => Uses all the space left
# Change the tipe of the partition
# Of partition 1
# To tipe 1 (EFI System)
# Write the changes
# EOF

# Insert the name without the /
export disk=$(cat disk.tmp)

cat <<EOF | fdisk /dev/${disk}
g
n


+550M
n



t
1
1
w
EOF

mkfs.fat -F32 /dev/${disk}1 # Make first partition (+550M) f32
mkfs.ext4 /dev/${disk}2     # Make the second partition(left space on the drive) ext4

mount /dev/${disk}2 /mnt    # Mount the big partition

# Install base and kernel
pacstrap /mnt base linux-lts linux-firmware --needed base-devel

genfstab -U /mnt >> /mnt/etc/fstab    # Generate filesystem table
arch-chroot /mnt                      # Change to root of the installation

# Select time zone
ln -sf /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime
# Set hardware clock
hwclock --systohc

# Set the locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# Hostname and password
echo ${hostname} >> /etc/hostname

cat >> /etc/hosts <<EOF
127.0.0.1       localhost
::1             localhost
127.0.1.1       ${hostname}.localdomain     ${hostname}
EOF
echo -e "${passwd}\n${passwd}" | passwd

# Grub config for uefi and NetworkManager
mkdir /boot/EFI
mount /dev/${disk}1 /boot/EFI
pacman -S --noconfirm grub efibootmgr dosfstools os-prober mtools networkmanager
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
