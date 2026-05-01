{pkgs, ...}: let
  username = "kuritsu";
  homeDirectory = "/home/${username}";
in {
  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
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
      ./modules/dev.nix
      ./modules/xdg.nix
    ];
  };
}
