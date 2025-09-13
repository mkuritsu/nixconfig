{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/6fff6c97-e141-403b-919b-0f6283b72dcc";
    fsType = "btrfs";
    options = [
      "subvol=root"
      "noatime"
      "compress=zstd"
      "x-gvfs-show"
      "x-gvfs-name=NIXOS"
    ];
  };

  boot.initrd.luks.devices."NIXCRYPT".device =
    "/dev/disk/by-uuid/b047c7d4-fab1-41d8-b6c1-0dd9e03bf104";

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/6fff6c97-e141-403b-919b-0f6283b72dcc";
    fsType = "btrfs";
    options = [
      "subvol=home"
      "noatime"
      "compress=zstd"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/6fff6c97-e141-403b-919b-0f6283b72dcc";
    fsType = "btrfs";
    options = [
      "subvol=nix"
      "noatime"
      "compress=zstd"
    ];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/6fff6c97-e141-403b-919b-0f6283b72dcc";
    fsType = "btrfs";
    options = [
      "subvol=log"
      "noatime"
      "compress=zstd"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/217C-0DE7";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/mnt/hdd" = {
    device = "/dev/disk/by-uuid/d376dfd3-139d-43f8-b3c3-d41938e5c2cc";
    fsType = "btrfs";
    options = [
      "noatime"
      "compress=zstd"
      "nofail"
      "x-gvfs-show"
      "x-gvfs-name=HDD"
    ];
  };

  fileSystems."/mnt/ssd2" = {
    device = "/dev/disk/by-uuid/d3311dec-fc4b-4103-8347-2b9afc23bdc1";
    fsType = "btrfs";
    options = [
      "noatime"
      "compress=zstd"
      "nofail"
      "x-gvfs-show"
      "x-gvfs-name=SSD2"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/09f965c6-2f0f-4886-9fde-2ed07db928cc"; }
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
