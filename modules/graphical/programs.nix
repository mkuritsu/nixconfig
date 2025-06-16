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
  };

  qt.enable = true;
  xdg.mime.enable = true;
  xdg.menus.enable = true;

  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.systemPackages = with pkgs; [
    # system utilities
    mangohud
    ueberzugpp
    blueman
    networkmanagerapplet
    brightnessctl
    nixfmt-rfc-style
    nixd
    ffmpeg-full
    imagemagick

    # programs
    ghostty
    mpv
    thunderbird
    rnote
    spotify
    vesktop
    easyeffects
    vscode
    android-studio
    youtube-music

    gnome-calendar

    kdePackages.dolphin
    kdePackages.kdegraphics-thumbnailers
    kdePackages.qtwayland
    kdePackages.okular
    kdePackages.kate
    kdePackages.ark
    kdePackages.gwenview
    kdePackages.qtmultimedia

    grim
    slurp
    wf-recorder
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
