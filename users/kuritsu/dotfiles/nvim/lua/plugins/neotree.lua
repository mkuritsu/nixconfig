return {
  "nvim-neo-tree/neo-tree",
  name = "neo-tree.nvim",
  lazy = false,
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignore = false,
        hide_hidden = false
      }
    }
  },
  keys = {
    {
      "<leader>d",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end
    }
  }
}
