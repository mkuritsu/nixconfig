{ pkgs, ... }:
{
  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.systemPackages = with pkgs; [
    brightnessctl
    gpu-screen-recorder
    hyprpicker
    fuzzel
    qt6ct
    kitty
    matugen
    kdePackages.qtstyleplugin-kvantum

    mpv
    imv
    kdePackages.okular
    kdePackages.dolphin
    kdePackages.ark
  ];
}
