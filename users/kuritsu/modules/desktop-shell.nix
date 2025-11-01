{ inputs, pkgs, ... }:
{
  imports = [
    inputs.dankmaterialshell.homeModules.dankMaterialShell.default
  ];

  programs.dankMaterialShell = {
    enable = true;
    quickshell.package = inputs.quickshell.packages.${pkgs.system}.default;
  };
}
