{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    inputs.mnw.homeManagerModules.default
  ];

  programs.mnw = {
    enable = true;
    luaFiles = [ ../dots/nvim/init.lua ];
    extraBinPath = with pkgs; [
      fzf
      ripgrep
      fd
      ghostscript

      lua-language-server
      clang-tools
      basedpyright
      typescript-language-server
      rust-analyzer
      rustfmt
      clippy
      marksman
      nixd
      nixfmt-rfc-style
      alejandra
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
        snacks-nvim
        nvim-treesitter.withAllGrammars
        cord-nvim
        flash-nvim
        lualine-nvim
        nvim-autopairs
        nvim-lspconfig
        nvim-treesitter-textobjects
        nvim-web-devicons
        which-key-nvim
        inputs.blink-cmp.packages.${system}.default

        catppuccin-nvim
        tokyonight-nvim
      ];

      dev.myconfig.pure = ../dots/nvim;
    };
  };
}
