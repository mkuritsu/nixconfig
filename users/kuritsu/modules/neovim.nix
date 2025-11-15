{ inputs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;
    settings = {
      vim = {
        globals.editorConfig = true;
        lazy.enable = true;

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };

        options = {
          shiftwidth = 4;
          tabstop = 4;
          expandtab = true;
        };

        autocomplete.blink-cmp.enable = true;
        autopairs.nvim-autopairs.enable = true;
        binds.whichKey.enable = true;
        notify.nvim-notify.enable = true;
        presence.neocord.enable = true;
        presence.neocord.setupOpts.logo_tooltip = "The Superior Text Editor";
        statusline.lualine.enable = true;
        treesitter.enable = true;
        treesitter.textobjects.enable = true;
        utility.snacks-nvim.enable = true;
        utility.snacks-nvim.setupOpts.indent.enabled = true;
        utility.motion.flash-nvim.enable = true;
        ui.borders.enable = true;

        visuals = {
          nvim-web-devicons.enable = true;
          fidget-nvim.enable = true;
          fidget-nvim.setupOpts.notification.window.winblend = 0;
          indent-blankline.enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        languages = {
          enableDAP = true;
          enableExtraDiagnostics = true;
          enableFormat = true;
          enableTreesitter = true;

          astro.enable = true;
          bash.enable = true;
          clang.enable = true;
          css.enable = true;
          html.enable = true;
          java.enable = true;
          lua.enable = true;
          markdown.enable = true;
          nix.enable = true;
          nix.format.type = "nixfmt";
          python.enable = true;
          rust.enable = true;
          rust.extensions.crates-nvim.enable = true;
          sql.enable = true;
          ts.enable = true;
          typst.enable = true;
          wgsl.enable = true;
          yaml.enable = true;
        };

        keymaps = [
          {
            key = "<leader>f";
            mode = "n";
            silent = true;
            action = "function() Snacks.picker.files() end";
            lua = true;
            desc = "fuzzy finder";
          }
          {
            key = "<leader>e";
            mode = "n";
            silent = true;
            action = "function() Snacks.explorer() end";
            lua = true;
            desc = "file tree";
          }
          {
            key = "<C-`>";
            mode = [
              "n"
              "t"
            ];
            silent = true;
            action = "function() Snacks.terminal() end";
            lua = true;
            desc = "toggle terminal";
          }
        ];
      };
    };
  };
}
