{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    inputs.mnw.homeManagerModules.default
  ];

  home.sessionVariables.EDITOR = lib.mkOverride 900 "nvim";

  programs.mnw = {
    enable = true;
    luaFiles = [ ../dotfiles/nvim/init.lua ];
    extraBinPath = with pkgs; [
      fzf
      ripgrep
      lua-language-server
      clang-tools
      pyright
      typescript-language-server
      rust-analyzer
      rustfmt
      clippy
      marksman
      nixd
      nixfmt-rfc-style
      alejandra
      kdePackages.qtdeclarative
      jdt-language-server
      vscode-langservers-extracted # html,css,json
      astro-language-server
      prettier
      cmake-language-server
    ];
    plugins = {
      start = with pkgs.vimPlugins; [
        lazy-nvim
        plenary-nvim
      ];

      opt = with pkgs.vimPlugins; [
        telescope-nvim
        catppuccin-nvim
        tokyonight-nvim
        lualine-nvim
        nvim-web-devicons
        nvim-lspconfig
        neocord
        which-key-nvim
        telescope-fzf-native-nvim
        lazydev-nvim
        blink-cmp
        bufferline-nvim
        snacks-nvim
        mini-pairs
        mini-indentscope
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects
        neo-tree-nvim
      ];

      dev.myconfig.pure = ../dotfiles/nvim;
    };
  };
}
