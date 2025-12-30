{
  config,
  lib,
  ...
}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;

  parsePath = path:
    builtins.replaceStrings
    [(builtins.toString ./.)]
    ["${builtins.getEnv "FLAKE_ROOT"}/users/kuritsu"]
    (builtins.toString path);

  sourceFile = path:
    if builtins.getEnv "FLAKE_ROOT" == ""
    then path
    else mkOutOfStoreSymlink (parsePath path);

  stripPath = path: str: builtins.replaceStrings [(builtins.toString path)] [""] str;
  substr1 = str: builtins.substring 1 (builtins.stringLength str) str;
  recurseFileStrings = path: map builtins.toString (lib.filesystem.listFilesRecursive path);
  scriptPathToAttrs = path: {
    name = ''${substr1 (stripPath ./dots path)}'';
    value = {
      source = sourceFile path;
    };
  };
  nvimFiles = map scriptPathToAttrs (recurseFileStrings ./dots/nvim);
in {
  xdg.configFile =
    {
      "hypr/hyprland.conf".source = sourceFile ./dots/hypr/hyprland.conf;
      "hypr/hypridle.conf".source = sourceFile ./dots/hypr/hypridle.conf;
      "uwsm/env".source = sourceFile ./dots/uwsm/env;
      "xdg-desktop-portal/Hyprland-portals.conf".source = ./dots/xdg-desktop-portal/Hyprland-portals.conf;

      "btop/btop.conf".source = ./dots/btop/btop.conf; # sourceFile not used because btop likes to write state to config file
      "btop/themes".source = sourceFile ./dots/btop/themes;

      "tmux/tmux.conf".source = sourceFile ./dots/tmux/tmux.conf;

      "git/config".source = sourceFile ./dots/git/config;

      "starship.toml".source = sourceFile ./dots/starship.toml;

      "fish/config.fish".source = sourceFile ./dots/fish/config.fish;
      "fish/functions/cd_fzf.fish".source = sourceFile ./dots/fish/functions/cd_fzf.fish;
      "fish/functions/fish_greeting.fish".source = sourceFile ./dots/fish/functions/fish_greeting.fish;
      "fish/functions/fish_user_key_bindings.fish".source =
        ./dots/fish/functions/fish_user_key_bindings.fish;

      "imv/config".source = sourceFile ./dots/imv/config;

      "ghostty/config".source = sourceFile ./dots/ghostty/config;
      "ghostty/style.css".source = sourceFile ./dots/ghostty/style.css;
    }
    // builtins.listToAttrs nvimFiles;
}
