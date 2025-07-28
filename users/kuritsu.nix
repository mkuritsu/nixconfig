{pkgs, ...}: {
  users.users.kuritsu = {
    isNormalUser = true;
    description = "kuritsu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
      "jellyfin"
    ];
    shell = pkgs.zsh;
  };
}
