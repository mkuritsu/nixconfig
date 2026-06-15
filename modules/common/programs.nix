{
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;
in {
  programs = {
    nano.enable = lib.mkForce false;
    fish.enable = true;
    gnupg.agent.enable = true;
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };

  environment.sessionVariables.EDITOR = "nvim";

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    delta
    fzf
    fd
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
    chezmoi
    openssl
    just
    libqalculate
    hyperfine
    bat
    btop
    pax-utils
    eza
    file
    zoxide
    neovim
    inputs.agenix.packages.${system}.default
  ];
}
