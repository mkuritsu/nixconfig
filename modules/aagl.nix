# Not working currently, infinite recursion, don't know why
{ ... }@inputs:
{
  imports = [
    inputs.aagl.nixosModules.default
  ];

  programs = {
    honkers-railway-launcher.enable = true;
  };
}
