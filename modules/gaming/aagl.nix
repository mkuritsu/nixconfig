{ inputs, pkgs, ... }:
{
  imports = [
    inputs.aagl.nixosModules.default
  ];

  programs = {
    honkers-railway-launcher.enable = true;
    anime-game-launcher.enable = true;
    sleepy-launcher.enable = true;
  };

  environment.systemPackages = with pkgs; [
    bubblewrap
  ];
}
