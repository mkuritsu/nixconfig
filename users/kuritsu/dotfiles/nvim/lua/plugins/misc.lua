return {
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy"
  },
  {
    "iogamaster/neocord",
    event = "VeryLazy",
    opts = {
      logo_tooltip = "The superior text editor"
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix"
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      }
    }
  },
  {
    "nvim-mini/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true
    }
  },
  {
    "nvim-mini/mini.indentscope",
    event = "VeryLazy",
    opts = {
      symbol = "│",
      draw = {
        delay = 0
      }
    }
  },
  {
    "folke/snacks.nvim",
    opts = function()
      Snacks.toggle.profiler():map("<leader>pp")
      Snacks.toggle.profiler_highlights():map("<leader>ph")
    end,
    keys = {
      {
        "<leader>ps",
        function()
          Snacks.profiler.scratch()
        end,
        desc = "Profiler Scratch Buffer"
      },
      {
        "<C-`>",
        mode = { "n", "t", "i" },
        function()
          Snacks.terminal()
        end,
        desc = "Toggle terminal"
      }
    }
  }
}
