{ ... }:
{
  home = {
    stateVersion = "24.11";
    username = "kuritsu";
    homeDirectory = "/home/kuritsu";
  };

  programs.home-manager.enable = true;

  imports = [
    ./browser.nix
    ./btop.nix
    ./desktop.nix
    ./git.nix
    ./spicetify.nix
    ./terminal.nix
    ./theming.nix
  ];
}
