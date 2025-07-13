return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'main',
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")
            treesitter.setup {
                -- Directory to install parsers and queries to
                install_dir = vim.fn.stdpath('data') .. '/site'
            }
            treesitter.install {
                "cpp"
            }
        end
    }
}
