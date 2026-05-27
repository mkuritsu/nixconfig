{
  inputs,
  pkgs,
  lib,
  ...
}: {
  boot.initrd.availableKernelModules = ["xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  boot.loader = {
    # systemd-boot.enable = true;
    limine = {
      enable = true;
      secureBoot = {
        enable = true;
        autoGenerateKeys = true;
        autoEnrollKeys.enable = true;
      };
    };
    efi.canTouchEfiVariables = true;
    timeout = 0;
  };

  environment.systemPackages = [pkgs.sbctl];
}
