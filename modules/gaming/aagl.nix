{
  sources,
  pkgs,
  ...
}:
{
  imports = [
    (import sources.aagl).module
  ];

  programs = {
    honkers-railway-launcher.enable = true;
    anime-game-launcher.enable = true;
    sleepy-launcher.enable = true;
  };

  environment.systemPackages = with pkgs; [
    bubblewrap # for sandboxing
  ];
}
