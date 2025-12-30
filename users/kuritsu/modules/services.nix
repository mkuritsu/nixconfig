{
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;
in {
  systemd.user.services.noctalia-shell = {
    Service = {
      ExecStart = lib.getExe inputs.noctalia.packages.${system}.default;
      Restart = "on-failure";
    };
  };

  services.hypridle.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
