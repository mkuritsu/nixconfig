{ pkgs, ... }:
{
  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    vim = {
      enable = true;
      defaultEditor = true;
    };
    neovim.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    fastfetch
    onefetch
    mangohud
    btop
    htop
    tmux
    fzf
    ueberzugpp
    wl-clipboard
  ];
}
