{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Networking
  networking = {
    hostName = "asuka";
    networkmanager.enable = true;
    networkmanager.dns = "none";
    useDHCP = false;
    dhcpcd.enable = false;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
    ];
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
