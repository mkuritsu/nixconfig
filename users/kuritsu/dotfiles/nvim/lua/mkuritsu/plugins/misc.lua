require("tokyonight").setup {
  transparent = false,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  }
}

require("catppuccin").setup {
  transparent_background = false,
  flavour = "mocha",
  no_italic = true,
  integrations = {
    treesitter = true,
    telescope = true,
    blink_cmp = {
      style = 'bordered',
    },
    flash = true,
    mini = {
      enable = true
    },
    neotree = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
    treesitter_context = true,
    which_key = true,
  }
}
vim.cmd("colorscheme catppuccin")

require("nvim-autopairs").setup {}
require("actions-preview").setup {}
require("nvim-web-devicons").setup {}
require("bufferline").setup {
  options = {
    offsets = {
      {
        filetype = "neo-tree",
        text = "Neotree",
        separator = true,
        text_align = "center",
      },
    }
  },
}


require('mini.indentscope').setup {
  symbol = "│"
}

require("toggleterm").setup {
  shell = "fish"
}

require("lualine").setup {
  options = {
    globalstatus = true,
    theme = "catppuccin",
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
