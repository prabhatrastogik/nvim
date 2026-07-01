-- File explorer sidebar (tree view).
-- Disables netrw (the built-in file browser) since nvim-tree fully replaces it.
-- Opens on the right side so it doesn't push code off-screen when toggled.
--
-- <leader>e  toggle the explorer open / closed

local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,    -- must be loaded at startup so netrw is disabled before it can hijack a directory arg
    init = function()
        -- Disable netrw before it loads; nvim-tree handles directory navigation instead
        vim.g.loaded_netrw       = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
        sort_by = "case_sensitive",
        view = {
            width = 40,
            side  = 'right',
        },
        renderer = {
            group_empty = true,  -- collapse directories that contain only one child
        },
    },
    keys = {
        { '<leader>e', "<cmd>NvimTreeToggle<cr>", desc = 'Toggle File Explorer' },
    },
}

return M
