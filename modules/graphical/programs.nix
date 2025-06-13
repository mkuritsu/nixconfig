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

    kdePackages.dolphin
    kdePackages.kio
    kdePackages.kdf
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kio-admin
    kdePackages.qtwayland
    kdePackages.plasma-integration
    kdePackages.kdegraphics-thumbnailers
    kdePackages.breeze-icons
    kdePackages.qtsvg
    kdePackages.kservice
    shared-mime-info

    kdePackages.okular
    kdePackages.kate

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
