{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Classic";
      };
    };
  };

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

  environment.systemPackages = [
    pkgs.catppuccin-sddm
    pkgs.bibata-cursors
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
