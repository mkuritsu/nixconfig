{
  inputs,
  pkgs,
  ...
}:
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

  documentation.man.generateCaches = false;

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
    tmux
    starship
    yazi
    ripgrep
    distrobox
    npins
    fish
    openssl
    just
    home-manager
    inputs.agenix.packages.${pkgs.system}.default
  ];
}
