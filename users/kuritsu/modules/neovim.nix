{pkgs, ...}: {
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
