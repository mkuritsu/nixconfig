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
    ./foot.nix
    ./git.nix
    ./hyprland.nix
    ./imv.nix
    ./misc.nix
    ./neovim.nix
    ./shell.nix
    ./theming.nix
    ./tmux.nix
    ./vscode.nix
  ];
}
