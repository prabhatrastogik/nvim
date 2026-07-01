-- Inline color preview — renders hex codes, rgb(), hsl(), and CSS color names
-- as a colored highlight behind or around the text.
-- Useful when editing CSS, Tailwind classes, or any config file with color values.

local M = {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        filetypes = { "*" },
        user_default_options = {
            RGB      = true,   -- #RGB shorthand
            RRGGBB   = true,   -- #RRGGBB
            names    = true,   -- named colors like "Blue"
            RRGGBBAA = true,   -- #RRGGBBAA with alpha
            AARRGGBB = false,  -- 0xAARRGGBB (Windows format, usually not needed)
            rgb_fn   = true,   -- CSS rgb() and rgba()
            hsl_fn   = true,   -- CSS hsl() and hsla()
            css      = true,   -- all CSS features
            css_fn   = true,   -- all CSS functions
            mode     = "background",  -- show color as the highlight background
            tailwind = true,   -- recognize Tailwind color class names
            virtualtext = "■",
        },
    },
}

return M
