require("tokyonight").setup {
  transparent = true
}
vim.cmd.colorscheme("tokyonight")

require("nvim-autopairs").setup {}
require("toggleterm").setup {}
require("lualine").setup {
  options = {
    globalstatus = true,
  }
}
require('nvim-web-devicons').setup {}

require("neocord").setup({
  logo_tooltip = "The superior text editor",
})

require("which-key").setup {
  preset = "helix"
}

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
