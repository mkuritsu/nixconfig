{ ... }:
let
  username = "kuritsu";
in
{
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };

  home-manager.users.kuritsu = {
    home = {
      stateVersion = "24.11";
      username = username;
      homeDirectory = "/home/${username}";
    };

    imports = [
      ./modules/browser.nix
      ./modules/gtk.nix
      ./modules/neovim.nix
      ./files.nix
    ];
  };
}
