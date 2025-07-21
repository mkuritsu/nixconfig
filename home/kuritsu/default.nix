{ ... }:
{
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
    ./hyprland.nix
    ./imv.nix
    ./misc.nix
    ./neovim.nix
    ./terminal.nix
    ./theming.nix
    ./uwsm.nix
    ./vscode.nix
  ];
}
