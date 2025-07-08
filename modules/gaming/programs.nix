{ inputs, pkgs, ... }:
{
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
  };

  environment.systemPackages = with pkgs; [
    prismlauncher
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
  ];
}
