{ pkgs, ... }:
{
  programs.noisetorch.enable = true;
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "footclient";
  };

  environment.systemPackages = with pkgs; [
    # system utilities
    mangohud
    blueman
    brightnessctl
    nixfmt-rfc-style
    nixfmt-tree
    nixd
    imagemagick

    # programs
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
    wiremix
    yazi
    nautilus
    file-roller

    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtwayland
    kdePackages.qt6ct
  ];
}
