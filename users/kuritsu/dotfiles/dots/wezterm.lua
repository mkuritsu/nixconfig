local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'CaskaydiaMono Nerd Font'
config.font_size = 11
config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true
config.default_prog = { 'fish' }
config.window_padding = {
    left = 6,
    right = 6,
    top = 4,
    bottom = 0
}

return config
