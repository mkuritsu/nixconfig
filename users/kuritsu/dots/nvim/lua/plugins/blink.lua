return {
  "saghen/blink.cmp",
  name = "blink-cmp",
  event = "VeryLazy",
  opts = {
    keymap = {
      preset = "enter",
      ["<C-k>"] = false,
      ['<C-y>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    signature = {
      enabled = true
    },

    completion = {
      list = { selection = { auto_insert = false } },

      ghost_text = {
        enabled = true,
        show_with_menu = true
      }
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  }
}
