require("tokyonight").setup {
  transparent = true
}
vim.cmd.colorscheme("tokyonight")

require("lazydev").setup {}
require("nvim-autopairs").setup {}
require("toggleterm").setup {}
require("lualine").setup {}
require('nvim-web-devicons').setup {}

require("neocord").setup({
  logo_tooltip = "The superior text editor",
})

require("neo-tree").setup {
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignore = false,
      hide_hidden = false
    },
    group_empty_dirs = true -- to have a same java development experience with 30 nested directories
  }
}

require("which-key").setup {
  preset = "modern"
}
