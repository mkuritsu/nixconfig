{ inputs, ... }:
{
  imports = [
    inputs.kushell.homeModules.kushell
  ];

  programs.kushell.enable = true;
}
