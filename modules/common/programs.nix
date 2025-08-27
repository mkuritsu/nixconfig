{
  inputs,
  pkgs,
  ...
}: {
  programs = {
    nix-ld.enable = true;
    adb.enable = true;
    fish.enable = true;
    direnv = {
      enable = true;
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
    btop
    fastfetch
    onefetch
    tmux
    yazi
    ripgrep
    inputs.agenix.packages.${pkgs.system}.default
  ];
}
