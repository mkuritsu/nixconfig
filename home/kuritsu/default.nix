{ ... }:
{
  home.stateVersion = "24.11";

  imports = [
    ./btop
    ./hypr
    ./wofi
    ./browser.nix
    ./dunst.nix
    ./foot.nix
    ./git.nix
    ./gtk.nix
    ./quickshell.nix
    ./shell.nix
    ./tmux.nix
    ./xdg.nix
  ];
}
