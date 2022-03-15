#!/bin/bash
# https://github.com/eoli3n/archiso-zfs
# TODO: store /boot on zfs for kernel snapshots
common_opts=(-O acltype=posixacl -O xattr=sa -O normalization=formD -O compression=lz4 -O relatime=on -O mountpoint=legacy)
zpool create -o ashift=13 -o autotrim=on -o cachefile=/etc/zfs/zpool.cache "${common_opts[@]}" ssd /dev/disk/by-id/ata-Samsung_SSD_860_EVO_500GB_S3Z2NB0KC36879L-part2
zpool create -o ashift=12 -o cachefile=none -o altroot=/hdd "${common_opts[@]}" hdd /dev/disk/by-id/ata-ST500LM012_HN-M500MBB_S2TRJ9CCB11080
zfs create ssd/root
zfs create ssd/home
zfs create -V 20G ssd/docker
mount.zfs ssd/root /mnt
mount.zfs ssd/home /mnt/home
mkfs.ext4 /dev/zvol/ssd/docker
mount /dev/zvol/ssd/docker /var/lib/docker
tail -1 /etc/mtab | tee -a /etc/fstab
# TODO: install all system dependencies (libvirt, docker, etc.)
yay -S prometheus prometheus-node-exporter --noconfirm --needed
sudo systemctl enable --now prometheus prometheus-node-exporter
