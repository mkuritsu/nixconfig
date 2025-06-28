{
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    firefox.enable = true;
    chromium.enable = true;
  };

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
    alacritty
    vesktop
    mpv
    thunderbird
    rnote
    spotify
    easyeffects
    vscode
    android-studio

    inputs.wiremix.packages.${pkgs.system}.default
  ];
}
