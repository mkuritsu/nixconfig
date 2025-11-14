{
  inputs,
  pkgs,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
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
    starship
    yazi
    ripgrep
    distrobox
    fish
    openssl
    just
    libqalculate
    inputs.agenix.packages.${system}.default
  ];
}
