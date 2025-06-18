{ pkgs, inputs, ... }:
let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
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
    pkgs-unstable.osu-lazer-bin
  ];
}
