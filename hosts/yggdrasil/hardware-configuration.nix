{
  config,
  lib,
  pkgs,
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
    device = "/dev/disk/by-uuid/1c7aeaaa-899b-449e-b425-159ee0a87cbf";
    fsType = "ext4";
  };

  fileSystems."/mnt/ssd2" = {
    fsType = "ext4";
    device = "/dev/disk/by-uuid/a6d24f19-006f-4fbd-9c68-12fd207bca62";
    options = [
      "nofail"
      "x-gvfs-show"
    ];
  };

  fileSystems."/mnt/hdd" = {
    fsType = "btrfs";
    device = "/dev/disk/by-uuid/78992061-e44e-47c4-bcb9-fc2935b5d710";
    options = [
      "nofail"
      "x-gvfs-show"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/FD36-0FFF";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/35459390-25e0-4a58-aa2c-104b3056db86"; }
  ];

  networking.useDHCP = lib.mkDefault true;
  networking.interfaces.enp34s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
