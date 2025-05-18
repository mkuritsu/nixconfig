{ ... }:
{
  programs = {
    zsh.enable = true;
    firefox.enable = true;
    hyprland.enable = true;
    neovim.enable = true;
    vim = {
      enable = true;
      defaultEditor = true;
    };
    foot = {
      enable = true;
      enableZshIntegration = false;
    };
    nix-ld.enable = true;
  };
}
