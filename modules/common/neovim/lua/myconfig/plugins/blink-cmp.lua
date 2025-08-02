require("blink-cmp").setup {
  keymap = { preset = 'enter' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  signature = {
    enabled = true
  },
  documentation = {
    auto_show = true,
    auto_show_delay_ms = 500
  },
  ghost_text = {
    enabled = true
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning"
  }
}
