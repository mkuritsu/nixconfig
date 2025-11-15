{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    loader.timeout = 5;
  };

  hardware.enableRedistributableFirmware = true;
}
