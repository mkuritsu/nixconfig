{ inputs, pkgs, ... }:
{
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # prismlauncher
    (inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin.override {
      pipewire_latency = "128/48000"; # default value causes audio cracks for me
    })
  ];
}
