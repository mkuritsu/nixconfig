{ inputs, pkgs, ... }:
{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;
    configDir = ./.;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      battery
      io
      hyprland
      network
      mpris
      notifd
      tray
      bluetooth
      cava
    ];
  };
}
