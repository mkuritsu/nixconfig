{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brightnessctl
    gpu-screen-recorder
    hyprpicker
    mako
    fuzzel
    swww
    qt6ct
    kitty
    matugen
    kdePackages.qtstyleplugin-kvantum
    ghostty
  ];
}
