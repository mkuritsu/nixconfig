{ inputs, ... }:
{
  imports = [
    inputs.dankmaterialshell.homeModules.dankMaterialShell.default
  ];

  programs.dankMaterialShell.enable = true;
}
