require("neo-tree").setup {
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignore = false,
      hide_hidden = false
    }
  },
  -- event_handlers = {
  --   {
  --     event = "file_open_requested",
  --     handler = function()
  --       vim.cmd("Neotree close")
  --     end
  --   }
  -- }
}
