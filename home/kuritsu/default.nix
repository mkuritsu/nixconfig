{ ... }:
{
  home.stateVersion = "24.11";
  home.username = "kuritsu";
  home.homeDirectory = "/home/kuritsu";

  programs.home-manager.enable = true;

  imports = [
    ./btop
    ./hypr
    ./browser.nix
    ./git.nix
    ./quickshell.nix
    ./shell.nix
    ./spicetify.nix
    ./theming.nix
    ./tmux.nix
    ./xdg.nix
  ];
}
