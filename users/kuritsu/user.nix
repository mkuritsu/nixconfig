{pkgs, ...}: {
  imports = [
    ./home.nix
  ];

  users.users.kuritsu = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };
}
