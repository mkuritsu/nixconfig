{ pkgs, ... }:
{
  services.xserver.videoDrivers = [
    "amdgpu"
  ];

  hardware.graphics.extraPackages = with pkgs; [
    amdvlk
  ];

  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];
}
