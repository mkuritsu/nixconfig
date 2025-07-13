{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  networking = {
    hostName = "fraxinus";
    useDHCP = false;
    dhcpcd.enable = false;
    useNetworkd = true;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
      "2001:4860:4860::8888"
      "2001:4860:4860::8844"
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
    interfaces.end0 = {
      ipv4.addresses = [
        {
          address = "192.168.1.80";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.168.1.254";
      interface = "end0";
    };
  };

  time.timeZone = "Europe/Lisbon";
  i18n.defaultLocale = "en_US.UTF-8";

  services.openssh.enable = true;

  users.users.kuritsu = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    optimise.automatic = true;
  };

  environment.systemPackages = with pkgs; [
    btop
    vim
    git
  ];

  system.stateVersion = "25.11";
}
