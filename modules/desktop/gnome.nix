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
    gnomeExtensions.dash-to-dock
    gnomeExtensions.resource-monitor
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.appindicator
  ];
}
