{
  inputs,
  pkgs,
  ...
}: {
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
    rofi-wayland
    swww
    inputs.kushell.packages.${pkgs.system}.default
  ];
}
