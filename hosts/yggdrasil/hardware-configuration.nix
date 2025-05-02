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

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/9cf10dd6-d688-4654-abe8-18c4c82acfa1";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/B5BB-150C";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/b925f496-ef99-466c-8e21-f67531f3088f"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp34s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
