{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
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

        startPlugins = [
          pkgs.vimPlugins.nvim-treesitter.withAllGrammars
        ];

        lazy.plugins = {
          "kanagawa.nvim" = {
            package = pkgs.vimPlugins.kanagawa-nvim;
            setupModule = "kanagawa";
            setupOpts = {
              inherit (config.programs.nvf.settings.vim.theme) transparent;
              keywordStyle.italic = false;
            };
          };
          "rose-pine" = {
            package = pkgs.vimPlugins.rose-pine;
            setupModule = "rose-pine";
            setupOpts = {
              variant = "moon";
              dim_inactive_windows = true;
              styles = {
                transparency = config.programs.nvf.settings.vim.theme.transparent;
                italic = false;
              };
            };
          };
        };

        extraPackages = with pkgs; [
          fd
        ];

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";

          transparent = true;
        };

        options = {
          tabstop = 4;
          shiftwidth = 4;
          expandtab = true;
          smartindent = true;
          autoindent = true;
          number = true;
          relativenumber = true;
          wrap = false;
          scrolloff = 10;
          swapfile = false;
          clipboard = "unnamedplus";
        };

        diagnostics = {
          enable = true;
          config = {
            virtual_text = true;
          };
        };

        autocomplete.blink-cmp.enable = true;
        autocomplete.blink-cmp.mappings = {
          next = "<C-n>";
          previous = "<C-p>";
        };

        autopairs.nvim-autopairs.enable = true;
        binds.whichKey.enable = true;
        binds.whichKey.setupOpts.preset = "helix";
        notify.nvim-notify.enable = true;
        statusline.lualine.enable = true;
        ui.borders.enable = true;

        visuals = {
          nvim-web-devicons.enable = true;
          fidget-nvim.enable = true;
          fidget-nvim.setupOpts.notification.window.winblend = 0;
          indent-blankline.enable = true;
        };

        presence.neocord = {
          enable = true;
          setupOpts.logo_tooltip = "The Superior Text Editor";
          setupOpts.global_timer = true;
        };

        treesitter = {
          enable = true;
          textobjects.enable = true;
          textobjects.setupOpts = {
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

        utility = {
          motion.flash-nvim.enable = true;
          snacks-nvim.enable = true;
          snacks-nvim.setupOpts.indent.enable = true;
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

          # astro.enable = true;
          bash.enable = true;
          clang.enable = true;
          css.enable = true;
          html.enable = true;
          java.enable = true;
          lua.enable = true;
          markdown.enable = true;
          nix.enable = true;
          nix.format.type = ["alejandra"];
          python.enable = true;
          python.format.type = ["ruff"];
          rust.enable = true;
          sql.enable = true;
          ts.enable = true;
          typst.enable = true;
          wgsl.enable = true;
          yaml.enable = true;
        };

        autocmds = [
          {
            event = ["TextYankPost"];
            callback = lib.generators.mkLuaInline ''
              function()
                vim.highlight.on_yank()
              end
            '';
          }
        ];

        keymaps = [
          {
            key = "<leader>e";
            mode = "n";
            silent = true;
            lua = true;
            action = "function() Snacks.explorer() end";
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
          {
            key = "<leader>f";
            mode = "n";
            silent = true;
            action = "function() Snacks.picker.files() end";
            lua = true;
            desc = "file picker";
          }
          {
            key = "<leader>g";
            mode = "n";
            silent = true;
            action = "function() Snacks.picker.grep() end";
            lua = true;
            desc = "grep";
          }
          {
            key = "<C-h>";
            mode = "i";
            silent = true;
            action = "<left>";
          }
          {
            key = "<C-j>";
            mode = "i";
            silent = true;
            action = "<down>";
          }
          {
            key = "<C-k>";
            mode = "i";
            silent = true;
            action = "<up>";
          }
          {
            key = "<C-l>";
            mode = "i";
            silent = true;
            action = "<right>";
          }
          {
            key = "<esc>";
            mode = "t";
            silent = true;
            action = "<C-\\><C-n>";
          }
          {
            key = "<leader>bd";
            mode = "n";
            silent = true;
            action = ":bd<CR>";
            desc = "close buffer";
          }
        ];
      };
    };
  };
}
