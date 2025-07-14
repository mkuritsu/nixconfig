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
    useNetworkd = true;
    interfaces.enp34s0 = {
      ipv4.addresses = [
        {
          address = "192.168.1.80";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.168.1.254";
      interface = "enp34s0";
    };
  };

  time.timeZone = "Europe/Lisbon";
  i18n.defaultLocale = "en_US.UTF-8";

  services.openssh = {
    enable = true;
    openFirewall = true;
  };

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
