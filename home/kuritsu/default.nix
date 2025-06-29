{ ... }:
{
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.username = "kuritsu";
  home.homeDirectory = "/home/kuritsu";

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
