{ pkgs, ... }:
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
    heroic
    prismlauncher
    osu-lazer-bin
  ];
}
