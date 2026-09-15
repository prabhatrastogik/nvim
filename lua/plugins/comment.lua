-- Commenting shortcuts using Comment.nvim.
-- Uses treesitter to detect the correct comment style for mixed-language files
-- (e.g. HTML with embedded JS, Python with SQL strings).
--
-- gcc         toggle line comment
-- gbc         toggle block comment
-- gc{motion}  comment over a motion (e.g. gcip = comment inner paragraph)
-- <C-/>       IDE-style toggle for current line (normal) or selection (visual)

local M = {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        mappings = {
            basic = true,   -- gcc, gbc, gc{motion}
            extra = true,   -- gco (open below), gcO (open above), gcA (append)
        },
        ignore = "^$"   -- don't comment empty lines
    },
    keys = {
        {
            "<C-/>",
            mode = "n",
            "<Plug>(comment_toggle_linewise_current)",
        },
        {
            "<C-_>",
            mode = "n",
            "<Plug>(comment_toggle_linewise_current)",
        },
        {
            "<C-/>",
            mode = "x",
            "<Plug>(comment_toggle_linewise_visual)",
        },
        {
            "<C-_>",
            mode = "x",
            "<Plug>(comment_toggle_linewise_visual)",
        },
    },
}

return M
