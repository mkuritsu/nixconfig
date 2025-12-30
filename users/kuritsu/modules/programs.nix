{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;

  spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
  spicetify-package = inputs.spicetify-nix.lib.mkSpicetify pkgs {
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      keyboardShortcut
    ];
  };
in {
  home.packages = [
    inputs.helium.packages.${system}.default
    inputs.zen-browser.packages.${system}.default
    inputs.noctalia.packages.${system}.default
    spicetify-package
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
      nixfmt-rfc-style
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
