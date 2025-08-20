{...}: {
  home = {
    stateVersion = "24.11";
    username = "kuritsu";
    homeDirectory = "/home/kuritsu";
  };

  imports = [
    ./browser.nix
    ./btop.nix
    ./git.nix
    ./hyprland.nix
    ./imv.nix
    ./kitty.nix
    ./mako.nix
    ./misc.nix
    ./mpd.nix
    ./shell.nix
    ./theming.nix
    ./tmux.nix
  ];
}
