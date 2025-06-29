{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "black_hole";
    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Classic";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    sddm-astronaut
    bibata-cursors
  ];
}
