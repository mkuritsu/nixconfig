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
    adb.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    fzf
    less
    jq
    zip
    unzip
    btop
    fastfetch
    onefetch
    wl-clipboard
    tmux
    distrobox
  ];
}
