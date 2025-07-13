local plugin = {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000
}

function plugin.config()
    local everforest = require("everforest")
    everforest.setup({
        transparent_background_level = 0,
        italics = false,
        disable_italic_comments = false,
        inlay_hints_background = "dimmed",
    })
    everforest.load()
end

return plugin
