{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.mnw.nixosModules.default
  ];

  environment.variables.EDITOR = lib.mkOverride 900 "nvim";

  programs.mnw = {
    enable = true;
    initLua = ''
      require("myconfig")
    '';
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
      nil
      kdePackages.qtdeclarative
      alejandra
      jdt-language-server
      vscode-langservers-extracted # html,css,json
      astro-language-server
      prettier
    ];
    plugins = {
      start = with pkgs; [
        vimPlugins.telescope-nvim
        vimPlugins.telescope-fzf-native-nvim
        vimPlugins.neocord
        vimPlugins.nvim-autopairs
        vimPlugins.toggleterm-nvim
        vimPlugins.nvim-treesitter.withAllGrammars
        vimPlugins.nvim-treesitter-textobjects
        vimPlugins.tokyonight-nvim
        vimPlugins.lualine-nvim
        vimPlugins.nvim-lspconfig
        vimPlugins.lazydev-nvim
        vimPlugins.blink-cmp
        vimPlugins.which-key-nvim
        vimPlugins.cheatsheet-nvim
        vimPlugins.neo-tree-nvim
        vimPlugins.flash-nvim
      ];

      dev.myconfig.pure = ./neovim;
    };
  };
}
