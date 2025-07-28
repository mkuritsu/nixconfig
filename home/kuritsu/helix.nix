{pkgs, ...}: {
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      rust-analyzer
      clang-tools
      jdt-language-server
      marksman
      lua-language-server
    ];
    themes = {
      tokyonight-nobg = {
        inherits = "tokyonight";
        "ui.background" = {};
      };
    };
    settings = {
      theme = "tokyonight-nobg";
      editor = {
        line-number = "relative";
      };
    };
  };
}
