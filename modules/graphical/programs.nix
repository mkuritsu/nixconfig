{
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    firefox.enable = true;
    chromium.enable = true;
    foot = {
      enable = true;
      enableZshIntegration = true;
    };
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
    vesktop
    mpv
    thunderbird
    rnote
    spotify
    vscodium

    inputs.wiremix.packages.${pkgs.system}.default
  ];
}
