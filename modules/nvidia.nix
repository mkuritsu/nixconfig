# The bane of my existence
{ pkgs, ... }:
{
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = false;
  };

  environment.systemPackages = with pkgs; [
    nvidia-vaapi-driver
  ];
}
