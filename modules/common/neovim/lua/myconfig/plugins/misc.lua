require("tokyonight").setup {
  transparent = true,
}
vim.cmd.colorscheme("tokyonight")

require("lazydev").setup()
require("neocord").setup({
  logo_tooltip = "The superior text editor",
})
require("nvim-autopairs").setup()
require("toggleterm").setup()
require("lualine").setup {}
require("neo-tree").setup({})
require("which-key").setup {
  preset = "modern"
}
