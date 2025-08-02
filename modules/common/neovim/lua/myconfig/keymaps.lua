-- executing lua (taken from Tj Devries advent of neovim)
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- terminal
vim.keymap.set({ "n", "t" }, "<C-`>", "<cmd>ToggleTerm<CR>")

-- telescope
vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>tg", require("telescope.builtin").live_grep)

-- file tree
vim.keymap.set({ "n", "i" }, "<C-b>", "<cmd>Neotree focus<CR>")

-- flash
vim.keymap.set("n", "s", function()
  require("flash").jump()
end)
