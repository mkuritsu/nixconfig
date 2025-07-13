return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.enable('clangd')
        vim.opt.completeopt = { "menuone", "noselect", "popup" }

        local lspConfig = require("lspconfig")
        lspConfig["clangd"].setup({
            on_attach = function(client, bufnr)
                vim.lsp.completion.enable(true, client.id, bufnr, {
                    autotrigger = true,
                    convert = function(item)
                        return { abbr = item.label:gsub("%b()", "") }
                    end,
                })
                vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
            end
        })
    end
}
