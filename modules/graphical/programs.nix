{
  self,
  pkgs,
  inputs,
  ...
}:
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
    youtube-music

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
    inputs.wiremix.packages.${pkgs.system}.default
    (inputs.quickshell.packages.${pkgs.system}.default.override {
      withJemalloc = true;
      withQtSvg = true;
      withWayland = true;
      withX11 = true;
      withPipewire = true;
      withPam = true;
      withHyprland = true;
    })
  ];
}
