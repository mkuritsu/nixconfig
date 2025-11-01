{ pkgs, ... }:
{
  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.systemPackages = with pkgs; [
    brightnessctl
    gpu-screen-recorder
    hyprpicker
    fuzzel
    kitty
    ghostty
    foot
    matugen
    mpv
    imv
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
    kdePackages.okular
    kdePackages.dolphin
    kdePackages.ark
  ];
}
