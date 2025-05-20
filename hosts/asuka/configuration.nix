{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Networking
  networking = {
    hostName = "asuka";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
    };
  };

  powerManagement.enable = true;
  services.thermald.enable = true;
  services.tlp.enable = true;

  system.stateVersion = "24.11";
}
