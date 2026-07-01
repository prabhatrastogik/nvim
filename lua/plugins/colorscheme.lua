-- Available colorschemes — only catppuccin loads eagerly (lazy = false, priority = 1000)
-- because it is the active theme set in init.lua.
-- The others are installed but load lazily; switch with <leader>fc (fzf colorschemes).

local M = {
    {
        'navarasu/onedark.nvim',
        config = true,
        opts = {
            style = 'cool', -- variants: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
        }
    },
    {
        "rose-pine/neovim",
        name   = "rose-pine",
        config = true,
    },
    {
        'marko-cerovac/material.nvim',
        config = true,
    },
    {
        "catppuccin/nvim",
        name     = "catppuccin",
        lazy     = false,       -- must load at startup — this is the active theme
        priority = 1000,        -- load before all other plugins so highlights apply correctly
    },
    {
        "folke/tokyonight.nvim",
        config = true,
        opts = function()
            return {
                style = "storm",
                on_highlights = function(hl, _)
                    -- Match gitsigns colours to a consistent palette
                    hl.GitSignsAdd    = { fg = "#A1C281" }
                    hl.GitSignsChange = { fg = "#74ADEA" }
                    hl.GitSignsDelete = { fg = "#FE747A" }
                end,
            }
        end,
    }
}

return M
