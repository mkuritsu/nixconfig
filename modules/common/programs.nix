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
    microfetch
    onefetch
    tmux
    yazi
    distrobox
    yt-dlp
    inputs.agenix.packages.${pkgs.system}.default
  ];
}
