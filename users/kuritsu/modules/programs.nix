{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;
in {
  home.packages = [
    inputs.helium.packages.${system}.default
    inputs.zen-browser.packages.${system}.default
    inputs.noctalia.packages.${system}.default
    pkgs.kdePackages.qtstyleplugin-kvantum
    pkgs.kdePackages.qt6ct
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = false;
    withPython3 = false;
    withRuby = false;
    extraPackages = with pkgs; [
      fzf
      ripgrep
      fd
      ghostscript
      tree-sitter
      gcc

      lua-language-server
      clang-tools
      basedpyright
      typescript-language-server
      rust-analyzer
      rustfmt
      clippy
      marksman
      nil
      nixfmt
      alejandra
      jdt-language-server
      vscode-langservers-extracted # html,css,json
      astro-language-server
      prettier
      cmake-language-server
      ruff
      stylua
      prettier
    ];
  };
}
