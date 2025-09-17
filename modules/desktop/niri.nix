{ pkgs, ... }:
{
  imports = [
    ./wm.nix
  ];

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
