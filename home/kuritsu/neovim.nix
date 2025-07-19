{ inputs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          transparent = true;
          name = "everforest";
          style = "medium";
        };
        lsp.enable = true;
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        presence.neocord.enable = true;

        languages = {
          enableTreesitter = true;
          enableFormat = true;
          nix.enable = true;
          rust.enable = true;
          clang.enable = true;
          clang.lsp.enable = true;
          python.enable = true;
          lua.enable = true;
          ts.enable = true;
        };
      };
    };
  };
}
