{ inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    grim
    slurp
    wf-recorder
    hyprpicker
    hyprshot
    hyprpolkitagent
    inputs.quickshell.packages.${pkgs.system}.default
  ];
}
