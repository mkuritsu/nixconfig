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
        ./modules/bash.nix
        ./modules/browser.nix
        ./modules/neovim.nix
        ./modules/desktop-shell.nix
        ./modules/spicetify.nix
        ./modules/theming.nix
        ./modules/xdg.nix
      ];
    };
}
