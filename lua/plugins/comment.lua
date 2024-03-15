-- Comment Shortcuts

local M = {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
        mappings = {
            basic = true,
            extra = true,
        },
        ignore = "^$"
    },
    keys = {
        {
            "<C-/>",
            mode = "n",
            "<Plug>(comment_toggle_linewise_current)",
        },
        {
            "<C-/>",
            mode = "x",
            "<Plug>(comment_toggle_linewise_visual)",
        },
    },
}

return M
