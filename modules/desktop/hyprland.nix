{pkgs, ...}: {
  services.gnome.gnome-keyring.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    gpu-screen-recorder
    grim
    slurp

    mpv
    nautilus
    file-roller
    ghostty
    imv
    zathura

    hyprpolkitagent
    hyprpicker
    noctalia-shell
  ];
}
