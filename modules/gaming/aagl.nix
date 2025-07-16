{ inputs, pkgs, ... }:
{
  imports = [
    inputs.aagl.nixosModules.default
  ];

  nix.settings = inputs.aagl.nixConfig;

  programs = {
    honkers-railway-launcher.enable = true;
    anime-game-launcher.enable = true;
    sleepy-launcher.enable = true;
  };

  environment.systemPackages = with pkgs; [
    bubblewrap # for sandboxing
  ];
}
