{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{

  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell.enable = true;

  # imports = [
  #   inputs.dankmaterialshell.homeModules.dankMaterialShell.default
  # ];

  # programs.dankMaterialShell = {
  #   enable = true;
  #   quickshell.package = inputs.quickshell.packages.${system}.default;
  # };
}
