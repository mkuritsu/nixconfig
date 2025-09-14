username: homeDirectory: isNixOS:
{ lib, pkgs, ... }:
let
  useSymlinks = !isNixOS;
in
{
  home = {
    stateVersion = "25.05";
    inherit username homeDirectory;
  };

  imports = [
    (import ./files.nix useSymlinks)
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
