{ config, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  xdg.configFile = {
    "Kvantum/Tokyonight".source = mkOutOfStoreSymlink ./dotfiles/Kvantum/Tokyonight;
    "Kvantum/kvantum.kvconfig".source = mkOutOfStoreSymlink ./dotfiles/Kvantum/kvantum.kvconfig;
    "qt6ct/qt6ct.conf".source = mkOutOfStoreSymlink ./dotfiles/qt6ct/qt6ct.conf;

    "kdeglobals".source = mkOutOfStoreSymlink ./dotfiles/kdeglobals;

    "mako/config".source = mkOutOfStoreSymlink ./dotfiles/mako/config;

    "hypr/hyprland.conf".source = mkOutOfStoreSymlink ./dotfiles/hypr/hyprland.conf;
    "hypr/hypridle.conf".source = mkOutOfStoreSymlink ./dotfiles/hypr/hypridle.conf;
    "uwsm/env".source = mkOutOfStoreSymlink ./dotfiles/uwsm/env;

    "fuzzel/fuzzel.ini".source = mkOutOfStoreSymlink ./dotfiles/fuzzel/fuzzel.ini;

    "imv/config".source = mkOutOfStoreSymlink ./dotfiles/imv/config;

    "niri/config.kdl".source = mkOutOfStoreSymlink ./dotfiles/niri/config.kdl;

    "btop/btop.conf".source = mkOutOfStoreSymlink ./dotfiles/btop/btop.conf;
    "btop/themes".source = mkOutOfStoreSymlink ./dotfiles/btop/themes;

    "git/config".source = mkOutOfStoreSymlink ./dotfiles/git/config;

    "tmux/tmux.conf".source = mkOutOfStoreSymlink ./dotfiles/tmux/tmux.conf;

    "starship.toml".source = mkOutOfStoreSymlink ./dotfiles/starship.toml;

    "kitty/kitty.conf".source = mkOutOfStoreSymlink ./dotfiles/kitty/kitty.conf;
    "kitty/themes".source = mkOutOfStoreSymlink ./dotfiles/kitty/themes;

    "fish/config.fish".source = mkOutOfStoreSymlink ./dotfiles/fish/config.fish;
    "fish/functions/cd_fzf.fish".source = mkOutOfStoreSymlink ./dotfiles/fish/functions/cd_fzf.fish;
    "fish/functions/fish_user_key_bindings.fish".source =
      ./dotfiles/fish/functions/fish_user_key_bindings.fish;
    "fish/functions/fish_greeting.fish".source =
      mkOutOfStoreSymlink ./dotfiles/fish/functions/fish_greeting.fish;

    "nvim".source = mkOutOfStoreSymlink ./dotfiles/nvim;

    "xdg-desktop-portal/Hyprland-portals.conf".source =
      ./dotfiles/xdg-desktop-portal/Hyprland-portals.conf;
  };

}
