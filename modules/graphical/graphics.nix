{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
    excludePackages = [ pkgs.xterm ];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
