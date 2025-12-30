let
  username = "kuritsu";
  homeDirectory = "/home/${username}";
in {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };

  home-manager.users.${username} = {osConfig, ...}: {
    home = {
      inherit (osConfig.system) stateVersion;
      inherit username homeDirectory;
    };

    imports = [
      ./files.nix
      ./modules/programs.nix
      ./modules/services.nix
      ./modules/theming.nix
    ];
  };
}
