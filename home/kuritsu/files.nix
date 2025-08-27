{...}: {
  xdg.configFile = {
    "Kvantum/Tokyonight".source = ./qt/themes/Tokyonight;
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Tokyonight
    '';
    "qt6ct/qt6ct.conf".source = ./qt/qt6ct.conf;

    "kdeglobals".text = ''
      [General]
      TerminalApplication=kitty
    '';

    "mako/config".source = ./mako/config;

    "hypr/hyprland.conf".source = ./hypr/hyprland.conf;
    "hypr/colors.conf".source = ./hypr/tokyonight.conf;
    "hypr/hypridle.conf".source = ./hypr/hypridle.conf;
    "uwsm/env".source = ./uwsm/env;

    "fuzzel/fuzzel.ini".source = ./fuzzel/fuzzel.ini;

    "imv/config".source = ./imv/config;
  };
}
