{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;

  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.kdegraphics-thumbnailers
    kdePackages.qtwayland
    kdePackages.okular
    kdePackages.kate
    kdePackages.ark
    kdePackages.gwenview
    kdePackages.qtmultimedia
    kdePackages.kcalc
    kdePackages.filelight
    kdePackages.kcolorchooser
    kdePackages.ksystemlog
    kdePackages.kolourpaint
    haruna
  ];
}
