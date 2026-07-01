-- Git hunk signs in the gutter (added/changed/deleted lines) and hunk navigation.
-- Also enables inline blame, hunk staging, and hunk previews.
-- Keymaps are set up automatically by gitsigns; press ]c / [c to jump between hunks.
return {
    "lewis6991/gitsigns.nvim",
    event  = "VeryLazy",
    config = true,
}
