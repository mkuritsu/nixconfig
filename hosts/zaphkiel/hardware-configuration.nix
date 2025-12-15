{
  config,
  lib,
  modulesPath,
  ...
}: {
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
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/3faa5ab2-d7d0-4637-bd0a-e7538d9ecc4f";
    fsType = "ext4";
    options = [
      "noatime"
    ];
  };

  fileSystems."/mnt/ssd3" = {
    device = "/dev/disk/by-uuid/48b48231-7090-4056-9836-e249b1fb55a6";
    fsType = "btrfs";
    options = [
      "nofail"
      "noatime"
      "x-gvfs-show=ssd3"
      "compress=zstd:3"
      "discard=async"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/88DC-AAB3";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/c1e5ce96-b25c-4d17-807c-8d755b505799";}
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
