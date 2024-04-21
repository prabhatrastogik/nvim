local M = {
    {
        'navarasu/onedark.nvim',
        lazy = false,
        priority = 1000,
        config = true,
        opts = {
            style = 'cool', -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        }
    },
    {
        'marko-cerovac/material.nvim',
        lazy = false,
        priority = 1000,
        config = true,
    },
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = function()
            local colors = {
                GitAdd = "#A1C281",
                GitChange = "#74ADEA",
                GitDelete = "#FE747A",
            }
            return {
                style = "storm",
                -- hide_inactive_statusline = true,
                on_highlights = function(hl, _)
                    hl.GitSignsAdd = {
                        fg = colors.GitAdd,
                    }
                    hl.GitSignsChange = {
                        fg = colors.GitChange,
                    }
                    hl.GitSignsDelete = {
                        fg = colors.GitDelete,
                    }
                end,
            }
        end,
        config = true,
    }
}

return M
