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

  services.power-profiles-daemon.enable = true;
  powerManagement.enable = true;

  system.stateVersion = "24.11";
}
