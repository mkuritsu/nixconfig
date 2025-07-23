{ self, inputs, ... }:
{
  imports = [
    inputs.agenix.nixosModules.default
  ];

  age.secrets = {
    tailscale.file = "${self}/secrets/fraxinus-tailscale.age";
    istannouncements-webhook = {
      file = "${self}/secrets/istannouncements-webhook.age";
      owner = "istannouncements";
    };
  };
}
