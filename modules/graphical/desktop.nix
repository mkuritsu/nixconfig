{lib, pkgs, ...}: {
  services.gnome.gnome-keyring.enable = lib.mkForce false;

  programs = {
    niri.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };

  security.pam.services.kwallet-fix = {
    enable = true;
    kwallet.enable = true;
    kwallet.forceRun = true;
  };

  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    gpu-screen-recorder
    grim
    slurp

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
    haruna

    hyprpicker
    xwayland-satellite
    vicinae

    adwaita-icon-theme
    yt-dlp
  ];
}
