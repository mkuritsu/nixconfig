{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell.enable = true;

  systemd.user.services.noctalia-shell = {
    Service = {
      ExecStart = lib.getExe config.programs.noctalia-shell.package;
      Restart = "on-failure";
    };
  };
}
