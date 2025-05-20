{ config, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Networking
  networking = {
    hostName = "asuka";
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
    };
  };

  system.stateVersion = "24.11";
}
