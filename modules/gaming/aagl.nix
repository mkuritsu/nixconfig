{ inputs, pkgs, ... }:
{
  imports = [
    inputs.aagl.nixosModules.default
  ];

  programs = {
    honkers-railway-launcher.enable = true;
  };

  environment.systemPackages = with pkgs; [
    bubblewrap
  ];
}
