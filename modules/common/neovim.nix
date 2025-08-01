{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nvf.nixosModules.default
  ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;
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
          lspconfig.enable = true;
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
            action = "<Cmd>Neotree focus<CR>";
          }
        ];
        diagnostics = {
          enable = true;
          config = {
            virtual_text = true;
          };
        };
        globals.editorconfig = true;

        visuals.nvim-web-devicons.enable = true;
        statusline.lualine.enable = true;
        presence.neocord.enable = true;
        autopairs.nvim-autopairs.enable = true;
        formatter.conform-nvim.enable = true;
        filetree.neo-tree.enable = true;
        utility = {
          multicursors.enable = true;
          motion.flash-nvim.enable = true;
        };
        comments.comment-nvim.enable = true;
        notes.todo-comments.enable = true;
        terminal.toggleterm.enable = true;
        autocomplete.blink-cmp.enable = true;
        tabline.nvimBufferline = {
          enable = true;
          mappings.closeCurrent = "<leader>bd";
        };
        telescope = {
          enable = true;
          extensions = [
            {
              name = "fzf";
              packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
              setup = {
                fzf = {
                  fuzzy = true;
                };
              };
            }
          ];
        };
        treesitter = {
          enable = true;
          indent.enable = true;
          textobjects = {
            enable = true;
            setupOpts = {
              select = {
                enable = true;
                keymaps = {
                  af = "@function.outer";
                  "if" = "@function.inner";
                  ac = "@class.outer";
                  ic = "@class.inner";
                  as = "@local.scope";
                };
                lookahead = true;
              };
            };
          };
        };
        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        languages = {
          enableTreesitter = true;
          enableFormat = true;
          enableDAP = true;
          enableExtraDiagnostics = true;

          astro.enable = true;
          bash.enable = true;
          clang.enable = true;
          csharp.enable = true;
          css.enable = true;
          html.enable = true;
          java.enable = true;
          lua.enable = true;
          markdown = {
            enable = true;
            format.enable = false;
          };
          nix.enable = true;
          python.enable = true;
          rust = {
            enable = true;
            crates.enable = true;
            format.enable = true;
          };
          sql.enable = true;
          ts.enable = true;
          typst.enable = true;
        };
      };
    };
  };
}
