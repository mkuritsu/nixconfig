{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.timeout = 0;
  };

  hardware.enableRedistributableFirmware = true;
}
