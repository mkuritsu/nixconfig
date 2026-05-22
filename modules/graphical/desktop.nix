{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;
in {
  services.gnome.gnome-keyring.enable = true;

  programs = {
    niri.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    dms-shell.enable = true;
  };

  # services.desktopManager.gnome.enable = true;
  # services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    gpu-screen-recorder
    grim
    slurp

    mpv
    nautilus
    file-roller
    ghostty
    foot
    papers
    loupe

    hyprpolkitagent
    hyprpicker
    xwayland-satellite
    vicinae

    adwaita-icon-theme
  ];
}
