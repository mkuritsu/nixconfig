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
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
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
    inputs.agenix.packages.${system}.default
  ];
}
