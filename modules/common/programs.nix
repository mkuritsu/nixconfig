{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;

  neovim-fhs = pkgs.buildFHSEnv {
    name = "nvim";
    targetPkgs = pkgs:
      with pkgs; [
        neovim
        tree-sitter
        gcc
        gnumake
        pkg-config
        stdenv.cc.cc.lib
        cargo
        rustc
      ];
    runScript = "nvim";
  };
in {
  programs = {
    fish.enable = true;
    gnupg.agent.enable = true;
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    delta
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
    neovim-fhs
    inputs.agenix.packages.${system}.default
  ];
}
