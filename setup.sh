#!/usr/bin/env sh

# Setup script to use during nixos installation to setup partitions, filesystems etc
# Usage: ./setup.sh <disk>
# Example: ./setup.sh /dev/nvme0n1
#
# References:
# - https://nixos.org/manual/nixos/stable/#sec-installation
# - https://notashelf.dev/posts/impermanence

if [ -z "$1" ]; then
    echo "Empty disk argument!"
    exit 1
fi

DISK=$1
PARTITION_PREFIX=$DISK
if [[ $DISK == /dev/nvme* ]]; then
    echo "NVME disk detected, updating partition prefix to include 'p' at the end"
    PARTITION_PREFIX="$DISK"p
fi
echo "PARTITION_PREFIX = $PARTITION_PREFIX"


# partitioning
CRYPT_MAPPER="/dev/mapper/NIXCRYPT"

echo "Setting up partition & filesystems..."
parted $DISK -- mklabel gpt

parted $DISK -- mkpart ESP fat32 1MB 1GB
parted $DISK -- set 1 esp on
mkfs.vfat -F 32 -n BOOT "$PARTITION_PREFIX"1
echo "Created 1GB fat32 boot partition at ${PARTITION_PREFIX}1"

parted $DISK -- mkpart swap linux-swap 1GB 9GB
mkswap -L SWAP "$PARTITION_PREFIX"2
echo "Created 8GB swap partition at ${PARTITION_PREFIX}2"

parted "$DISK" -- mkpart primary 9GB 100%
cryptsetup --verify-passphrase -v luksFormat "$PARTITION_PREFIX"3
cryptsetup open "$PARTITION_PREFIX"3 NIXCRYPT
mkfs.btrfs -L NIXOS $CRYPT_MAPPER
echo "Create encrypted btrfs parition, mapper: $CRYPT_MAPPER"


# create btrfs subvolumes
mount -t btrfs $CRYPT_MAPPER /mnt

btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/nix
btrfs subvolume create /mnt/log

btrfs subvolume snapshot -r /mnt/root /mnt/root-blank

umount /mnt


# mounting
EXTRA_FLAGS=",compress=zstd,noatime"

mount -o subvol=root$EXTRA_FLAGS $CRYPT_MAPPER /mnt

mkdir /mnt/home
mount -o subvol=home$EXTRA_FLAGS $CRYPT_MAPPER /mnt/home

mkdir /mnt/nix
mount -o subvol=nix$EXTRA_FLAGS $CRYPT_MAPPER /mnt/nix

mkdir -p /mnt/var/log
mount -o subvol=log$EXTRA_FLAGS $CRYPT_MAPPER /mnt/var/log

mkdir /mnt/boot
mount "$PARTITION_PREFIX"1 /mnt/boot

swapon "$PARTITION_PREFIX"2


# nixos config
nixos-generate-config --root /mnt
echo "nixos config generated in /mnt/etc/nixos, modify as you please and do nixos-install to finish installation"