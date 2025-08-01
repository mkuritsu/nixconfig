{pkgs, ...}: {
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      rust-analyzer
      clang-tools
      jdt-language-server
      marksman
      lua-language-server
      typescript-language-server
      deno
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
        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "warning";
      };
    };
  };
}
