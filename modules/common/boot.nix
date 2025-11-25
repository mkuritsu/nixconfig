{ pkgs, ... }:
{
  boot = {
    loader.timeout = 5;
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
