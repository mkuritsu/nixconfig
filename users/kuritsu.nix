{ pkgs, ... }:
{
  users.users.kuritsu = {
    isNormalUser = true;
    description = "kuritsu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
    shell = pkgs.zsh;
  };
}
