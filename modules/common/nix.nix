{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--nogcroots --keep-since 7d"; # --nogcroots so it doesn't delete my devshell direnvs
    };
  };
}
