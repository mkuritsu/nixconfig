local telescope = require("telescope")
telescope.setup({
  extensiosn = {
    fzf = {},
  },
})
telescope.load_extension("fzf")
