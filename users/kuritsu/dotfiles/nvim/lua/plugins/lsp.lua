return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      vim.lsp.enable({
        "lua_ls", "ts_ls", "clangd", "pyright", "qmlls", "rust_analyzer", "jdtls", "marksman", "html", "cssls", "astro",
        "nixd", "cmake"
      })
    end
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        "lazy.nvim",
      }
    }
  }
}
