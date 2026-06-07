{pkgs, ...}: {
  imports = [
    ./boot.nix
    ./fs.nix
    ./hardware.nix
  ];

  networking.networkmanager = {
    enable = true;
    dns = "none";
    plugins = with pkgs; [
      networkmanager-strongswan
      networkmanager-openvpn
    ];
  };

  services = {
    thermald.enable = true;
    power-profiles-daemon.enable = true;
    openssh = {
      enable = true;
      openFirewall = true;
      settings.PasswordAuthentication = false;
    };
  };

  system.stateVersion = "24.11";
}
