return {
    { "nvim-lua/plenary.nvim" },
    -- { "MunifTanjim/nui.nvim" },
    { "nvim-tree/nvim-web-devicons",         opts = { default = true } },
    { 'akinsho/bufferline.nvim',             dependencies = 'nvim-tree/nvim-web-devicons', event = "VeryLazy", config = true, },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",                                 opts = {},          event = "VeryLazy" },
    { "lewis6991/gitsigns.nvim",             event = "VeryLazy",                           config = true, },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
}
