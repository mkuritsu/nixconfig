require("tokyonight").setup {
  transparent = true
}
vim.cmd.colorscheme("tokyonight")

require("nvim-autopairs").setup {}
require("toggleterm").setup {
  shell = "fish"
}
require("lualine").setup {
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_x = {
      { 'encoding' },
      { 'fileformat' },
      { 'filetype' },
      {
        'lsp_status',
        icon = '',
        symbols = {
          spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
          done = '✓',
          separator = ' ',
        }
      }
    }
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
