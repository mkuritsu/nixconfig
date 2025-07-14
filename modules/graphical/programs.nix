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
    blueman
    brightnessctl
    nixfmt-rfc-style
    nixd
    imagemagick

    # programs
    vesktop
    mpv
    thunderbird
    rnote
    spotify
    vscode
    ani-cli

    inputs.wiremix.packages.${pkgs.system}.default
  ];
}
