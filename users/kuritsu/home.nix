{
  home-manager.users.kuritsu = {
    osConfig,
    lib,
    ...
  }: {
    home = {
      username = "kuritsu";
      homeDirectory = "/home/kuritsu";
      stateVersion = "24.11";
    };

    imports =
      [
        ./modules/xdg.nix
      ]
      ++ lib.optionals osConfig.hardware.graphics.enable [
        ./modules/dank-shell.nix
        ./modules/dev.nix
      ];
  };
}
