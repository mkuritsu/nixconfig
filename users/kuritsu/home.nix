username: homeDirectory: isNixOS:
{ lib, pkgs, ... }:
{
  home = {
    stateVersion = "25.05";
    inherit username homeDirectory;
  };

  imports = [
    ./files.nix
    ./modules/gtk.nix
    ./modules/xdg.nix
  ]
  ++ lib.optionals isNixOS [
    ./modules/browser.nix
    ./modules/neovim.nix
  ];

  home.packages = with pkgs; [
    app2unit
  ];
}
