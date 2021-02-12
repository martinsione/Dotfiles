#!/bin/bash

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
export disk=vda
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

# Grub config for uefi
mkdir /boot/EFI
mount /dev/${disk}1 /boot/EFI
pacman -S --noconfirm grub efibootmgr dosfstools os-prober mtools
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

# Hostname and password
export hostname=arch
echo ${hostname} >> /etc/hostname

cat >> /etc/hosts <<EOF
127.0.0.1       localhost
::1             localhost
127.0.1.1       ${hostname}.localdomain     ${hostname}
EOF

passwd # probar ponerlo a lo ult?

pacman -S --noconfirm networkmanager git
systemctl enable NetworkManager

umount -l /mnt
