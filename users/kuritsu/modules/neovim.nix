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
      ruff
    ];
    plugins = {
      start = with pkgs.vimPlugins; [
        lazy-nvim
      ];

      opt = with pkgs.vimPlugins; [
        # dependencies
        plenary-nvim
        nui-nvim

        catppuccin-nvim
        tokyonight-nvim
        lualine-nvim
        nvim-web-devicons
        nvim-lspconfig
        cord-nvim
        which-key-nvim
        lazydev-nvim
        blink-cmp
        bufferline-nvim
        snacks-nvim
        nvim-autopairs
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects
      ];

      dev.myconfig.pure = ../dotfiles/nvim;
    };
  };
}
