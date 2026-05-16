{inputs, pkgs, ...}: {
  services.gnome.gnome-keyring.enable = true;

  programs = {
    niri.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };

  services.desktopManager.gnome.enable = true;
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
    dms-shell
    dgop
    quickshell
    xwayland-satellite
    vicinae

    adwaita-icon-theme
    uwsm
  ];
}
