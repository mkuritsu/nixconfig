{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;
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
    bat
    inputs.agenix.packages.${system}.default
  ];
}
