require("nvim-treesitter.configs").setup {
  sync_install = false,
  modules = {},
  ensure_installed = {},
  ignore_install = {},
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["as"] = "@local.scope"
      }
    }
  }
}
