{
  # self,
  sources,
  pkgs,
  ...
}:
let
  spicetify-nix = import sources.spicetify-nix { };
  spicePkgs = spicetify-nix.packages;
in
{
  imports = [
    spicetify-nix.nixosModules.default
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

  xdg.terminal-exec.enable = true;

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
    # inputs.viu.packages.${pkgs.system}.default
    # self.packages.${pkgs.system}.reverb-toggle
    pkgs.mypkgs.reverb-toggle
    imv
    wiremix
    easyeffects
    scrcpy
    zathura
    wl-clipboard
    vscode
    nautilus
    file-roller
    kdePackages.okular
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.kdegraphics-thumbnailers
    kdePackages.ffmpegthumbs
  ];
}
