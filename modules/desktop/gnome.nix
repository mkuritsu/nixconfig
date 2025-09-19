{ pkgs, ... }:
{
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    totem
    evince
    rhythmbox
    gnome-music
    geary
  ];

  environment.systemPackages = with pkgs; [
    showtime
    papers
    amberol
  ];
}
