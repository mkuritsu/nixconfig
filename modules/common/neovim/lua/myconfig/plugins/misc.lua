require("tokyonight").setup {
  transparent = true,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  }
}

require("catppuccin").setup {
  transparent_background = true,
  flavour = "mocha",
  no_italic = true,
  float = {
    transparent = true,
    solid = false
  }
}

vim.cmd.colorscheme("tokyonight")

require("nvim-autopairs").setup {}
require("actions-preview").setup {}
require('mini.indentscope').setup {
  symbol = "│"
}
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
