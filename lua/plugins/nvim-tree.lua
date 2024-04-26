-- File Explorer

local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
        sort_by = "case_sensitive",
        view = {
            width = 40,
            side = 'right',
        },
        renderer = {
            group_empty = true,
        },
    },
    keys = {
        { '<leader>e', "<cmd>NvimTreeToggle<cr>", desc = 'Toggle Explorer' },
    },
}

return M
