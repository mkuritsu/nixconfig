{ pkgs, ... }:
{
  users.users.kuritsu = {
    isNormalUser = true;
    description = "kuritsu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "adbusers"
    ];
    shell = pkgs.zsh;
  };
}
