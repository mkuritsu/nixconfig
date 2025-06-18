{ ... }:
{
  home.stateVersion = "24.11";

  imports = [
    ./btop
    ./hypr
    ./browser.nix
    ./git.nix
    ./gtk.nix
    ./quickshell.nix
    ./shell.nix
    ./spicetify.nix
    ./terminal.nix
    ./tmux.nix
    ./xdg.nix
  ];
}
