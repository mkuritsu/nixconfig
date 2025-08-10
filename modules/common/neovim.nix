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
        telescope-nvim
        telescope-fzf-native-nvim
        neocord
        nvim-autopairs
        toggleterm-nvim
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects
        tokyonight-nvim
        lualine-nvim
        nvim-lspconfig
        lazydev-nvim
        blink-cmp
        which-key-nvim
        cheatsheet-nvim
        neo-tree-nvim
        flash-nvim
        nvim-web-devicons
      ];

      dev.myconfig.pure = ./neovim;
    };
  };
}
