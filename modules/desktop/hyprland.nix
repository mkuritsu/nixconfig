{ pkgs, ... }:
{
  imports = [
    ./wm.nix
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  services.hypridle.enable = true;

  environment.systemPackages = with pkgs; [
    grim
    slurp
    grimblast
    hyprpolkitagent
    app2unit
  ];
}
