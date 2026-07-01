-- Shared utility libraries and UI primitives used as dependencies by other plugins.
-- These rarely need to be configured directly.

return {
    { "nvim-lua/plenary.nvim" },                                        -- async utilities, used by telescope, gitsigns, etc.
    { 'echasnovski/mini.icons',      config = true },                   -- icon provider (replaces nvim-web-devicons in some plugins)
    { "nvim-tree/nvim-web-devicons", opts = { default = true } },       -- file-type icons used by nvim-tree, lualine, trouble, etc.
    { 'stevearc/dressing.nvim',      event = "VeryLazy" },              -- better vim.ui.select and vim.ui.input (used by LSP rename, etc.)
}
