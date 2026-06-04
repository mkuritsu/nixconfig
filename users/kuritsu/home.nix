{
  home-manager.users.kuritsu = {osConfig, ...}: {
    home = {
      username = "kuritsu";
      homeDirectory = "/home/kuritsu";
      stateVersion = "24.11";
    };

    imports = [
      ./modules/dank-shell.nix
      ./modules/dev.nix
      ./modules/xdg.nix
    ];
  };
}
