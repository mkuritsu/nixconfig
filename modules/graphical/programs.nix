{ pkgs, ... }:
{
  programs.noisetorch.enable = true;

  # fix dolphin not showing apps
  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

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
      withOpenASAR = true;
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
