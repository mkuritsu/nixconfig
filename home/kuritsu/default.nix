{ ... }:
{
  home.stateVersion = "24.11";

  imports = [
    ./btop
    ./hypr
    ./waybar
    ./wofi
    ./ags.nix
    ./direnv.nix
    ./dunst.nix
    ./firefox.nix
    ./foot.nix
    ./git.nix
    ./gtk.nix
    ./starship.nix
    ./tmux.nix
    ./xdg.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;
}
