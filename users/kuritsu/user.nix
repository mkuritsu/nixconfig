{ ... }:
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

  # home-manager.users.${username} = {
  #   imports = [
  #     (import ./home.nix username homeDirectory true)
  #   ];
  # };
}
