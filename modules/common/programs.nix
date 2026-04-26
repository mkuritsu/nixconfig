{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;
in {
  programs = {
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    fzf
    less
    jq
    zip
    unzip
    fastfetch
    onefetch
    tmux
    zellij
    starship
    yazi
    ripgrep
    distrobox
    chezmoi
    openssl
    just
    libqalculate
    hyperfine
    bat
    btop
    pax-utils
    neovim
    tree-sitter
    inputs.agenix.packages.${system}.default
  ];
}
