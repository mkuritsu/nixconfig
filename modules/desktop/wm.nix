{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brightnessctl
    gpu-screen-recorder
    hyprpicker
    fuzzel
    qt6ct
    kitty
    matugen
    kdePackages.qtstyleplugin-kvantum
  ];
}
