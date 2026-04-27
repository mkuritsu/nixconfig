{pkgs, ...}: {
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
  };

  services.flatpak.packages = [
    "org.prismlauncher.PrismLauncher"
  ];

  environment.systemPackages = with pkgs; [
    osu-lazer-bin
  ];
}
