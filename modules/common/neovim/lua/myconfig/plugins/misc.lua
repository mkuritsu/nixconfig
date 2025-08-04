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

require("which-key").setup {
  preset = "modern"
}
