local pickers_layout = {
  layout_config = {
    prompt_position = "top",
  },
  sorting_strategy = "ascending",
}

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  event = "VeryLazy",
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  opts = {
    pickers = {
      find_files = pickers_layout,
      live_grep = pickers_layout
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  },
  keys = {
    {
      "<leader>f",
      function()
        require("telescope.builtin").find_files()
      end,
    },
    {
      "<leader>g",
      function()
        require("telescope.builtin").live_grep()
      end,
    },
  },
}
