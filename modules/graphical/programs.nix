{ inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [
    inputs.spicetify-nix.nixosModules.default
  ];

  programs = {
    noisetorch.enable = true;
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "footclient";
    };
    spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    # system utilities
    mangohud
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
