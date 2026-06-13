{
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    timeout = 0;
    systemd-boot.enable = true;
  };
}
