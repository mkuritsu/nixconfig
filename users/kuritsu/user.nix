{pkgs, ...}: let
  username = "kuritsu";
in {
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };

  environment.systemPackages = with pkgs; [
    catppuccin-cursors.mochaDark
    adw-gtk3
    adwaita-icon-theme
  ];

  home-manager.users.kuritsu = {
    home = {
      stateVersion = "24.11";
      username = username;
      homeDirectory = "/home/${username}";
    };

    imports = [
      ./modules/browser.nix
      ./modules/services.nix
      ./modules/neovim.nix
    ];

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };

    home.sessionVariables = {
      XCURSOR_SIZE = 24;
      XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    };

    xdg = {
      enable = true;
      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };

    xdg.configFile = {
      "Kvantum/Tokyonight".source = ./dotfiles/Kvantum/Tokyonight;
      "Kvantum/kvantum.kvconfig".source = ./dotfiles/Kvantum/kvantum.kvconfig;
      "qt6ct/qt6ct.conf".source = ./dotfiles/qt6ct/qt6ct.conf;

      "kdeglobals".source = ./dotfiles/kdeglobals;

      "mako/config".source = ./dotfiles/mako/config;

      "hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
      "hypr/hypridle.conf".source = ./dotfiles/hypr/hypridle.conf;
      "uwsm/env".source = ./dotfiles/uwsm/env;

      "fuzzel/fuzzel.ini".source = ./dotfiles/fuzzel/fuzzel.ini;

      "imv/config".source = ./dotfiles/imv/config;

      "niri/config.kdl".source = ./dotfiles/niri/config.kdl;

      "btop/btop.conf".source = ./dotfiles/btop/btop.conf;
      "btop/themes".source = ./dotfiles/btop/themes;

      "git/config".source = ./dotfiles/git/config;

      "tmux/tmux.conf".source = ./dotfiles/tmux/tmux.conf;

      "starship.toml".source = ./dotfiles/starship.toml;

      "kitty/kitty.conf".source = ./dotfiles/kitty/kitty.conf;
      "kitty/themes".source = ./dotfiles/kitty/themes;

      "fish/config.fish".source = ./dotfiles/fish/config.fish;
      "fish/functions/cd_fzf.fish".source = ./dotfiles/fish/functions/cd_fzf.fish;
      "fish/functions/fish_user_key_bindings.fish".source = ./dotfiles/fish/functions/fish_user_key_bindings.fish;
      "fish/functions/fish_greeting.fish".source = ./dotfiles/fish/functions/fish_greeting.fish;

      "user-dirs.dirs".source = ./dotfiles/user-dirs.dirs;
      "xdg-terminals.list".source = ./dotfiles/xdg-terminals.list;

      "gtk-3.0/bookmarks".source = ./dotfiles/gtk-3.0/bookmarks;
      "gtk-3.0/settings.ini".source = ./dotfiles/gtk-3.0/settings.ini;
      "gtk-4.0/settings.ini".source = ./dotfiles/gtk-4.0/settings.ini;
    };
  };
}
