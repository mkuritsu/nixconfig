-- executing lua (taken from Tj Devries advent of neovim)
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- arrow keys
vim.keymap.set("i", "<C-h>", "<left>")
vim.keymap.set("i", "<C-j>", "<down>")
vim.keymap.set("i", "<C-k>", "<up>")
vim.keymap.set("i", "<C-l>", "<right>")

-- terminal
vim.keymap.set({ "n", "t" }, "<C-`>", "<cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- telescope
vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>g", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<leader>th", require("telescope.builtin").builtin)

-- file tree
vim.keymap.set("n", "<leader>d", "<cmd>Neotree toggle<CR>")

-- flash
vim.keymap.set("n", "<leader>s", function()
  require("flash").jump()
end)

-- lsp
vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
vim.keymap.set("i", "<C-.>", require("actions-preview").code_actions)

-- misc
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>")
