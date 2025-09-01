require("neo-tree").setup {
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignore = false,
      hide_hidden = false
    }
  },
}
