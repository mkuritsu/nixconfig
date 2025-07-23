{ ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
  };

  home.file.".config/foot/foot.ini".source = ./foot/foot.ini;
  home.file.".config/foot/colors.ini".source = ./foot/tokyonight.ini;
}
