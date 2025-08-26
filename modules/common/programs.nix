{
  inputs,
  pkgs,
  ...
}: {
  programs = {
    nix-ld.enable = true;
    adb.enable = true;
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
    inputs.agenix.packages.${pkgs.system}.default
  ];
}
