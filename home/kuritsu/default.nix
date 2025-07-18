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
    ./desktop.nix
    ./discord.nix
    ./git.nix
    ./neovim.nix
    ./terminal.nix
    ./theming.nix
    ./uwsm.nix
  ];
}
