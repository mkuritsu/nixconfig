{ self, pkgs, ... }:
{
  programs = {
    firefox.enable = true;
    chromium.enable = true;
    hyprland.enable = true;
    foot = {
      enable = true;
      enableZshIntegration = false;
    };
    noisetorch.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # system utilities
    mangohud
    ueberzugpp
    blueman
    networkmanagerapplet
    brightnessctl
    alejandra
    nixfmt-rfc-style
    nixd
    ffmpeg-full
    imagemagick

    # programs
    papers
    mpv
    nautilus
    loupe
    gnome-calendar
    thunderbird
    rnote
    gnome-text-editor
    file-roller
    spotify
    vesktop
    pkgs.easyeffects
    vscode
    android-studio

    # for hyprland
    grim
    slurp
    dunst
    wofi
    wf-recorder
    waybar
    pavucontrol
    hyprpaper
    hypridle
    hyprlock
    hyprpicker
    hyprpolkitagent
    self.packages.${pkgs.system}.hyprpaper-switcher
    self.packages.${pkgs.system}.youtube-music
  ];
}
