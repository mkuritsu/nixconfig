{
  inputs,
  pkgs,
  ...
}:
{
  programs = {
    nix-ld.enable = true;
    adb.enable = true;
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
    btop
    fastfetch
    onefetch
    tmux
    starship
    yazi
    ripgrep
    distrobox
    npins
    inputs.agenix.packages.${pkgs.system}.default
  ];
}
