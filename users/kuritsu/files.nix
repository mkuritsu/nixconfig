useSymlinks:
{
  config,
  lib,
  ...
}:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  sourceFile = path: if useSymlinks then mkOutOfStoreSymlink path else path;

  stripPath = path: str: builtins.replaceStrings [ (builtins.toString path) ] [ "" ] str;
  substr1 = str: builtins.substring 1 (builtins.stringLength str) str;
  recurseFileStrings = path: map builtins.toString (lib.filesystem.listFilesRecursive path);
  scriptPathToAttrs = path: {
    name = ''${substr1 (stripPath ./dotfiles path)}'';
    value = {
      source = sourceFile path;
    };
  };

  nvimFiles = map scriptPathToAttrs (recurseFileStrings ./dotfiles/nvim);
in
{
  xdg.configFile = {
    "nvim-test".text = ''
      ${builtins.toString (map (n: n.name) nvimFiles)}
    '';

    "Kvantum/Tokyonight".source = sourceFile ./dotfiles/Kvantum/Tokyonight;
    "Kvantum/kvantum.kvconfig".source = sourceFile ./dotfiles/Kvantum/kvantum.kvconfig;
    "qt6ct/qt6ct.conf".source = sourceFile ./dotfiles/qt6ct/qt6ct.conf;

    "kdeglobals".source = sourceFile ./dotfiles/kdeglobals;

    "mako/config".source = sourceFile ./dotfiles/mako/config;

    "hypr/hyprland.conf".source = sourceFile ./dotfiles/hypr/hyprland.conf;
    "hypr/hypridle.conf".source = sourceFile ./dotfiles/hypr/hypridle.conf;
    "uwsm/env".source = sourceFile ./dotfiles/uwsm/env;

    "fuzzel/fuzzel.ini".source = sourceFile ./dotfiles/fuzzel/fuzzel.ini;

    "imv/config".source = sourceFile ./dotfiles/imv/config;

    "niri/config.kdl".source = sourceFile ./dotfiles/niri/config.kdl;

    "btop/btop.conf".source = sourceFile ./dotfiles/btop/btop.conf;
    "btop/themes".source = sourceFile ./dotfiles/btop/themes;

    "git/config".source = sourceFile ./dotfiles/git/config;

    "tmux/tmux.conf".source = sourceFile ./dotfiles/tmux/tmux.conf;

    "starship.toml".source = sourceFile ./dotfiles/starship.toml;

    "kitty/kitty.conf".source = sourceFile ./dotfiles/kitty/kitty.conf;
    "kitty/themes".source = sourceFile ./dotfiles/kitty/themes;
    "ghostty/config".source = sourceFile ./dotfiles/ghostty/config;

    "fish/config.fish".source = sourceFile ./dotfiles/fish/config.fish;
    "fish/functions/cd_fzf.fish".source = sourceFile ./dotfiles/fish/functions/cd_fzf.fish;
    "fish/functions/fish_user_key_bindings.fish".source =
      ./dotfiles/fish/functions/fish_user_key_bindings.fish;
    "fish/functions/fish_greeting.fish".source =
      sourceFile ./dotfiles/fish/functions/fish_greeting.fish;

    "xdg-desktop-portal/Hyprland-portals.conf".source =
      ./dotfiles/xdg-desktop-portal/Hyprland-portals.conf;
  }
  // builtins.listToAttrs nvimFiles;
}
