{pkgs, ...}: {
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
  };

  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        jdk17
        jdk21
      ];
    })
    osu-lazer-bin
    heroic
    mindustry
  ];
}
