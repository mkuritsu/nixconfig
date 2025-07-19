{ inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = false;
  };
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    blueman
    brightnessctl
    grim
    slurp
    wf-recorder
    hyprpicker
    hyprshot
    hyprpolkitagent
    inputs.kushell.packages.${pkgs.system}.default
  ];
}
