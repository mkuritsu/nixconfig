{
  inputs,
  pkgs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [
    inputs.spicetify-nix.nixosModules.default
  ];

  programs = {
    spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
      ];
      theme = spicePkgs.themes.hazy;
    };
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = "kvantum";
  };

  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.systemPackages = with pkgs; [
    # system utilities
    mangohud
    imagemagick

    # programs
    (discord.override {
      withVencord = true;
    })
    vesktop
    mpv
    thunderbird
    rnote
    ani-cli
    imv
    wiremix
    yazi
    easyeffects
    stremio
    scrcpy

    kdePackages.dolphin
    kdePackages.ark
    kdePackages.okular
    kdePackages.kdegraphics-thumbnailers
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtwayland
    kdePackages.qt6ct
    kdePackages.ffmpegthumbs
  ];
}
