{ ... }:
{
  home.stateVersion = "24.11";

  imports = [
    ./btop
    ./hypr
    ./browser.nix
    ./foot.nix
    ./git.nix
    ./gtk.nix
    ./quickshell.nix
    ./shell.nix
    ./tmux.nix
    ./xdg.nix
  ];
}
