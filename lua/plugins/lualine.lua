-- Statusline at the bottom and buffer list in the tabline.
-- theme = 'auto' picks a matching theme based on the active colorscheme.
-- The tabline section shows open buffers; use <leader><Left>/<Right> to cycle through them.

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    opts = {
        options = {
            theme = 'auto'
        },
        tabline = {
            lualine_a = { 'buffers' }   -- show open buffers in the tab bar
        }
    },
    config = true,
}
