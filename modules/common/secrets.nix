{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.agenix.nixosModules.default
  ];

  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.system}.default
  ];

  age.secrets.zaphkiel-tailscale.file = ../../secrets/zaphkiel-tailscale.age;
}
