{inputs, ...}: {
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
          name = "tokyonight";
          style = "night";
        };
        lsp = {
          enable = true;
          formatOnSave = true;
        };
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };
        debugger = {
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };
        options = {
          shiftwidth = 4;
          tabstop = 4;
          autoindent = true;
          expandtab = true;
          smartindent = true;
          guifont = "CaskaydiaMono Nerd Font Mono";
        };
        visuals = {
          nvim-web-devicons.enable = true;
        };
        keymaps = [
          {
            key = "<M-BS>";
            mode = "i";
            action = "<C-w>";
          }
          {
            key = "<C-`>";
            mode = "t";
            action = "<Cmd>ToggleTerm<CR>";
          }
          {
            key = "<C-`>";
            mode = "n";
            action = "<Cmd>ToggleTerm<CR>";
          }
          {
            key = "<C-b>";
            mode = "n";
            action = "<Cmd>Neotree toggle<CR>";
          }
        ];
        globals.editorconfig = true;
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.blink-cmp.enable = true;
        presence.neocord.enable = true;
        autopairs.nvim-autopairs.enable = true;
        formatter.conform-nvim.enable = true;
        filetree.neo-tree.enable = true;
        comments.comment-nvim.enable = true;
        terminal.toggleterm.enable = true;
        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };
        utility.multicursors.enable = true;
        notes.todo-comments.enable = true;
        languages = {
          enableTreesitter = true;
          enableFormat = true;
          markdown.enable = true;
          nix.enable = true;
          rust = {
            enable = true;
            crates.enable = true;
          };
          clang.enable = true;
          python.enable = true;
          html.enable = true;
          css.enable = true;
          ts.enable = true;
          lua.enable = true;
          java.enable = true;
          typst.enable = true;
        };
      };
    };
  };
}
