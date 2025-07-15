{
  pkgs,
  inputs,
  ...
}:
{
  programs.noisetorch.enable = true;

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
    (discord.override {
      withVencord = true;
    })
    mpv
    thunderbird
    rnote
    spotify
    vscode
    ani-cli
    imv
    inputs.wiremix.packages.${pkgs.system}.default

    kdePackages.dolphin
    kdePackages.ark
    kdePackages.kdegraphics-thumbnailers
    kdePackages.ffmpegthumbs
    kdePackages.qtsvg
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.qt6ct
  ];
}
