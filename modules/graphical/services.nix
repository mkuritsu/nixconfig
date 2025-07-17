{ pkgs, ... }:
{
  hardware.opentabletdriver.enable = true;

  services.upower.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.printing.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      sddm-astronaut
    ];
  };

  hardware.bluetooth.enable = true;

  xdg.mime.enable = true;
  xdg.menus.enable = true;
}
