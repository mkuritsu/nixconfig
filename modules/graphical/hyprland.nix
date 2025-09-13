{
  inputs,
  pkgs,
  ...
}:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  services.hypridle.enable = true;

  environment.systemPackages = with pkgs; [
    blueman
    brightnessctl
    grim
    slurp
    gpu-screen-recorder
    hyprpicker
    hyprshot
    hyprpolkitagent
    mako
    fuzzel
    swww
    qt6ct
    app2unit
    kitty
    kdePackages.qtstyleplugin-kvantum
    inputs.noctalia.packages.${pkgs.system}.default
  ];
}
