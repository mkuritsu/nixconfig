{
  boot.initrd.luks.devices."NIXCRYPT" = {
    device = "/dev/disk/by-partlabel/primary";
    allowDiscards = true;
    bypassWorkqueues = true;
  };

  fileSystems."/" = {
    device = "/dev/mapper/NIXCRYPT";
    fsType = "btrfs";
    options = ["subvol=root" "noatime" "compress=zstd:9" "x-gvfs-show" "x-gvfs-name=root"];
  };

  fileSystems."/home" = {
    device = "/dev/mapper/NIXCRYPT";
    fsType = "btrfs";
    options = ["subvol=home" "noatime" "compress=zstd:9"];
  };

  fileSystems."/nix" = {
    device = "/dev/mapper/NIXCRYPT";
    fsType = "btrfs";
    options = ["subvol=nix" "noatime" "compress=zstd:9"];
  };

  fileSystems."/var/log" = {
    device = "/dev/mapper/NIXCRYPT";
    fsType = "btrfs";
    options = ["subvol=log" "noatime" "compress=zstd:9"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
    options = ["fmask=0177" "dmask=0077" "noatime"];
  };

  # swapDevices = [
  #   {device = "/dev/disk/by-label/SWAP";}
  # ];

  fileSystems."/mnt/ssd2" = {
    device = "/dev/disk/by-label/ssd2";
    fsType = "btrfs";
    options = ["noatime" "compress=zstd:9" "x-gvfs-show" "x-gvfs-name=ssd2" "nofail"];
  };
}
