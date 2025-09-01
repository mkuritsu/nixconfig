local pickers_layout = {
  layout_config = {
    prompt_position = "top",
  },
  sorting_strategy = "ascending",
}

local telescope = require("telescope")
telescope.setup({
  pickers = {
    find_files = pickers_layout,
    live_grep = pickers_layout
  },
  extensiosn = {
    fzf = {},
  },
})
telescope.load_extension("fzf")
