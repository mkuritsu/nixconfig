{ ... }:
{
  imports = [
    ./localization.nix
    ./programs.nix
    ./nix.nix
    ./audio.nix
    ./services.nix
    ./boot.nix
  ];
}
