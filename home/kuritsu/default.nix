{...}: {
  home = {
    stateVersion = "24.11";
    username = "kuritsu";
    homeDirectory = "/home/kuritsu";
  };

  imports = [
    ./browser.nix
    ./btop.nix
    ./discord.nix
    ./git.nix
    ./helix.nix
    ./hyprland.nix
    ./imv.nix
    ./kitty.nix
    ./misc.nix
    ./shell.nix
    ./theming.nix
    ./tmux.nix
  ];
}
