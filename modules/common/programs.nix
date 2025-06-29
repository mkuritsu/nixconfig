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
    fastfetch
    onefetch
    btop
    htop
    tmux
    fzf
    wl-clipboard
    zip
    unzip
    jq
    less
    tmux-sessionizer
  ];
}
