{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };

  networking = {
    interfaces.enp34s0 = {
      ipv4.addresses = [
        {
          address = "192.168.1.70";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.168.1.254";
      interface = "enp34s0";
    };
  };

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings.PasswordAuthentication = false;
  };

  hardware.openrazer.enable = true;

  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

  users.users.kuritsu.extraGroups = [ "openrazer" ];

  system.stateVersion = "24.11";
}
