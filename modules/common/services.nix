{ pkgs, ... }:
{
  virtualisation = {
    libvirtd.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      autoPrune.enable = true;
    };
  };

  zramSwap.enable = true;

  environment.systemPackages = with pkgs; [
    podman-compose
  ];

  hardware.enableRedistributableFirmware = true;
}
