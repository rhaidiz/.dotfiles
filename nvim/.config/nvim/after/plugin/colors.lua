require('rose-pine').setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "moon", -- main, moon, or dawn
})

require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    }
})
