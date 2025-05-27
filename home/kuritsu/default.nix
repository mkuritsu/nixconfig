{ ... }:
{
  home.stateVersion = "24.11";

  imports = [
    ./btop
    ./dunst
    ./foot
    ./hypr
    ./waybar
    ./wofi
    ./tmux
    ./scripts
    ./starship
    ./ags.nix
    ./direnv.nix
    ./firefox.nix
    ./git.nix
    ./gtk.nix
    ./xdg.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;
}
