{
  inputs,
  ...
}:
let
  username = "kuritsu";
  homeDirectory = "/home/${username}";
in
{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };

  home-manager.users.${username} =
    { osConfig, ... }:
    {
      home = {
        stateVersion = osConfig.system.stateVersion;
        inherit username homeDirectory;
      };

      imports = [
        inputs.dotfiles.homeModules.default
        inputs.dankmaterialshell.homeModules.dankMaterialShell.default
        ./modules/browser.nix
        ./modules/neovim.nix
      ];

      programs.dankMaterialShell = {
        enable = true;
        enableSystemd = true;
      };
    };
}
