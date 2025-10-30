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
        ./home.nix
        ./modules/browser.nix
        ./modules/neovim.nix
        ./modules/shell.nix
        ./modules/gtk.nix
        ./modules/xdg.nix
      ];
    };
}
