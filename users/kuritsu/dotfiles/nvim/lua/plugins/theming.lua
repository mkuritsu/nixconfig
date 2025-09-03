return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = true,
      style = "moon",
      styles = {
        comments = { italic = false },
        keywords = { italic = false }
      }
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin-nvim",
    lazy = true,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        no_italic = true,
        auto_integrations = true
      }
    end
  }
}
