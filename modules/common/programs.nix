{
  inputs,
  pkgs,
  ...
}: {
  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    adb.enable = true;
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
    btop
    fastfetch
    microfetch
    onefetch
    wl-clipboard
    tmux
    distrobox
    helix
    inputs.agenix.packages.${pkgs.system}.default
  ];
}
