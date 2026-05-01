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
      networkmanager-openvpn
      networkmanager-strongswan
    ];
    wifi = {
      powersave = true;
      macAddress = "random";
      scanRandMacAddress = true;
    };
  };

  services = {
    openssh.enable = true;
    thermald.enable = true;
    power-profiles-daemon.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nm-connection-editor-only
  ];

  system.stateVersion = "24.11";
}
