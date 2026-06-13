{
  boot.initrd.availableKernelModules = ["xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    timeout = 0;
    systemd-boot.enable = true;
  };
}
