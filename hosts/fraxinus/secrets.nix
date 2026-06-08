{
  self,
  inputs,
  ...
}: {
  imports = [
    inputs.agenix.nixosModules.default
  ];

  age.secrets = {
    tailscale.file = "${self}/secrets/fraxinus-tailscale.age";
    acoustic-bot-env.file = "${self}/secrets/acoustic-bot-env.age";
  };
}
