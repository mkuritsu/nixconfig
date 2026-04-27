{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
  };

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

  environment.systemPackages = with pkgs; [
    nm-connection-editor-only
  ];

  system.stateVersion = "24.11";
}
