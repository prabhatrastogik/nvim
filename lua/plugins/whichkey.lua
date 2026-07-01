-- Shows a popup of available keymaps after you pause mid-sequence.
-- e.g. pressing <Space> then waiting 300ms shows all <leader> keymaps.
-- timeoutlen controls how long to wait before the popup appears.

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        vim.o.timeout    = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
            sort = { 'icase' }
        }
    end
}
