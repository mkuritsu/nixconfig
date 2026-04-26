{pkgs, ...}: {
  services.gnome.gnome-keyring.enable = true;

  programs.niri.enable = true;
  # programs.hyprland = {
  #   enable = true;
  #   withUWSM = true;
  # };

  environment.systemPackages = with pkgs; [
    brightnessctl
    gpu-screen-recorder
    grim
    slurp

    mpv
    nautilus
    file-roller
    ghostty
    papers
    loupe

    hyprpolkitagent
    hyprpicker
    noctalia-shell
    xwayland-satellite
  ];
}
