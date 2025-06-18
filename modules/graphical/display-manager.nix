{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Classic";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    catppuccin-sddm
    bibata-cursors
  ];
}
