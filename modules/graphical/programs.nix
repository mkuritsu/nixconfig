{
  self,
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
    };
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = "kvantum";
  };

  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.sessionVariables = {
    TERMINAL = "kitty";
  };

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
    zathura
    wl-clipboard
    newsflash
    self.packages.${pkgs.system}.reverb-toggle

    kdePackages.dolphin
    kdePackages.ark
    kdePackages.okular
    kdePackages.kdegraphics-thumbnailers
    kdePackages.ffmpegthumbs
  ];
}
