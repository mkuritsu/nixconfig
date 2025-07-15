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
    noisetorch.enable = true;
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
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.kdegraphics-thumbnailers
    kdePackages.ffmpegthumbs
    kdePackages.qtsvg
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.qt6ct

    inputs.wiremix.packages.${pkgs.system}.default
  ];
}
