{
  boot.initrd.luks.devices."NIXCRYPT" = {
    device = "/dev/disk/by-partlabel/primary";
    allowDiscards = true;
    bypassWorkqueues = true;
  };

  fileSystems."/" = {
    device = "/dev/mapper/NIXCRYPT";
    fsType = "btrfs";
    options = ["subvol=root" "noatime" "compress=zstd" "x-gvfs-show" "x-gvfs-name=root"];
  };

  fileSystems."/home" = {
    device = "/dev/mapper/NIXCRYPT";
    fsType = "btrfs";
    options = ["subvol=home" "noatime" "compress=zstd"];
  };

  fileSystems."/nix" = {
    device = "/dev/mapper/NIXCRYPT";
    fsType = "btrfs";
    options = ["subvol=nix" "noatime" "compress=zstd"];
  };

  fileSystems."/var/log" = {
    device = "/dev/mapper/NIXCRYPT";
    fsType = "btrfs";
    options = ["subvol=log" "noatime" "compress=zstd"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022" "noatime"];
  };

  swapDevices = [
    {device = "/dev/disk/by-label/SWAP";}
  ];
}
