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
    binfmt.emulatedSystems = ["aarch64-linux"];
  };

  programs.localsend.enable = true;
  programs.localsend.openFirewall = true;

  networking.networkmanager = {
    enable = true;
    dns = "none";
    plugins = with pkgs; [
      networkmanager-strongswan
      networkmanager-openvpn
    ];
  };

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings.PasswordAuthentication = false;
  };

  environment.systemPackages = with pkgs; [
    nm-connection-editor-only
  ];

  system.stateVersion = "24.11";
}
