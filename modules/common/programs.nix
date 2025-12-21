{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;
in {
  programs = {
    adb.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
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
    fish
    openssl
    just
    libqalculate
    hyperfine
    bat
    btop
    pax-utils
    inputs.agenix.packages.${system}.default

    (python3.withPackages (pypkgs: [
      pypkgs.requests
      pypkgs.numpy
      pypkgs.pandas
      pypkgs.matplotlib
    ]))
  ];
}
