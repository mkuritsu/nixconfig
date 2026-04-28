{
  self,
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
    distrobox
    chezmoi
    openssl
    just
    libqalculate
    hyperfine
    bat
    btop
    pax-utils
    eza
    zoxide
    bat
    self.packages.${system}.neovim-fhs
    inputs.agenix.packages.${system}.default
  ];
}
