{ pkgs, ... }:
{
  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.systemPackages = with pkgs; [
    brightnessctl
    gpu-screen-recorder
    hyprpicker
    kitty
    foot
    ghostty
    matugen
    mpv
    imv
    kdePackages.okular
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    kdePackages.gwenview
    swappy
  ];
}
