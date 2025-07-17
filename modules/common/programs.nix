{ pkgs, ... }:
{
  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    vim.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
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
