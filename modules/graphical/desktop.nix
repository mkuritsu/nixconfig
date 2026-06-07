{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;
in {
  services.gnome.gnome-keyring.enable = true;

  programs = {
    # niri.enable = true;
    # hyprland = {
    #   enable = true;
    #   withUWSM = true;
    # };
  };

  # services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    # brightnessctl
    # gpu-screen-recorder
    # grim
    # slurp

    mpv
    ghostty
    foot

    # papers
    # nautilus
    # file-roller
    # loupe

    kdePackages.okular
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.gwenview

    # hyprpicker
    # xwayland-satellite
    vicinae

    adwaita-icon-theme
  ];
}
