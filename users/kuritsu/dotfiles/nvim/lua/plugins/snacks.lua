return {
  "folke/snacks.nvim",
  opts = function()
    Snacks.toggle.profiler():map("<leader>pp")
    Snacks.toggle.profiler_highlights():map("<leader>ph")

    vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", nocombine = true })
    vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = "none", nocombine = true })

    return {
      indent = {
        enabled = true
      }
    }
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
    },
    {
      "<leader>f",
      function()
        Snacks.picker.files()
      end
    },
    {
      "<leader>g",
      function()
        Snacks.picker.grep()
      end
    },
    {
      "<leader>d",
      function()
        Snacks.explorer()
      end
    }
  }
}
