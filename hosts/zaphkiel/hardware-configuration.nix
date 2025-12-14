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
  };

  fileSystems."/mnt/ssd3" = {
    device = "/dev/disk/by-uuid/b65f344c-07ee-455b-9998-ccb57209c414";
    fsType = "ext4";
    options = [
      "nofail"
      "x-gvfs-show=ssd3"
    ];
  };

  # fileSystems."/mnt/hdd" = {
  #   device = "/dev/disk/by-uuid/052aa2b0-4797-43da-8752-9186e936531d";
  #   fsType = "ext4";
  # };

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
