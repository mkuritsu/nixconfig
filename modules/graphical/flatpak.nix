{ inputs, ... }:
{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "com.discordapp.Discord"
    ];
    overrides = {
      "com.discordapp.Discord".Context = {
        filsystems = [
          "host"
        ];
      };
    };
  };
}
