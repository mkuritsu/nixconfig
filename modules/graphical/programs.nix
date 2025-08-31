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
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "kitty";
    };
  };

  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.sessionVariables = {
    TERMINAL = "kitty";
  };

  environment.systemPackages = with pkgs; [
    mangohud
    discord
    vesktop
    mpv
    thunderbird
    rnote
    inputs.viu.packages.${pkgs.system}.default
    imv
    wiremix
    easyeffects
    scrcpy
    zathura
    wl-clipboard
    vscode
    self.packages.${pkgs.system}.reverb-toggle
    rmpc
    nautilus
    file-roller
    kdePackages.okular
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.kdegraphics-thumbnailers
    kdePackages.ffmpegthumbs
  ];
}
