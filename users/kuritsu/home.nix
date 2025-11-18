{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;

  parsePath =
    path:
    builtins.replaceStrings
      [ (builtins.toString ./.) ]
      [ "${builtins.getEnv "FLAKE_ROOT"}/users/kuritsu" ]
      (builtins.toString path);

  sourceFile =
    path: if builtins.getEnv "FLAKE_ROOT" == "" then path else mkOutOfStoreSymlink (parsePath path);

  stripPath = path: str: builtins.replaceStrings [ (builtins.toString path) ] [ "" ] str;
  substr1 = str: builtins.substring 1 (builtins.stringLength str) str;
  recurseFileStrings = path: map builtins.toString (lib.filesystem.listFilesRecursive path);
  scriptPathToAttrs = path: {
    name = ''${substr1 (stripPath ./dots path)}'';
    value = {
      source = sourceFile path;
    };
  };

  nvimFiles = map scriptPathToAttrs (recurseFileStrings ./dots/nvim);
in
{
  home.packages = with pkgs; [
    app2unit # here because not commonly packaged in other distros
  ];

  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  xdg.configFile = {
    "hypr/hyprland.conf".source = sourceFile ./dots/hypr/hyprland.conf;
    "hypr/hypridle.conf".source = sourceFile ./dots/hypr/hypridle.conf;
    "uwsm/env".source = sourceFile ./dots/uwsm/env;
    "xdg-desktop-portal/Hyprland-portals.conf".source = ./dots/xdg-desktop-portal/Hyprland-portals.conf;

    "niri/config.kdl".source = sourceFile ./dots/niri/config.kdl;

    "imv/config".source = sourceFile ./dots/imv/config;

    "btop/btop.conf".source = ./dots/btop/btop.conf;
    "btop/themes".source = sourceFile ./dots/btop/themes;

    "tmux/tmux.conf".source = sourceFile ./dots/tmux/tmux.conf;

    "git/config".source = sourceFile ./dots/git/config;

    "starship.toml".source = sourceFile ./dots/starship.toml;

    "kitty/kitty.conf".source = sourceFile ./dots/kitty/kitty.conf;
    "kitty/themes".source = sourceFile ./dots/kitty/themes;

    "fish/config.fish".source = sourceFile ./dots/fish/config.fish;
    "fish/functions/cd_fzf.fish".source = sourceFile ./dots/fish/functions/cd_fzf.fish;
    "fish/functions/fish_user_key_bindings.fish".source =
      ./dots/fish/functions/fish_user_key_bindings.fish;
    "fish/functions/fish_greeting.fish".source = sourceFile ./dots/fish/functions/fish_greeting.fish;
  }
  // builtins.listToAttrs nvimFiles;
}
