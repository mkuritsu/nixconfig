{
  self,
  inputs,
  ...
}:
{
  imports = [
    inputs.agenix.nixosModules.default
  ];

  # age.secrets = {
  #   tailscale.file = "${self}/secrets/zaphkiel-tailscale.age";
  # };
}
