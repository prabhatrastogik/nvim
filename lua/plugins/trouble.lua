return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    -- lazy = false,
    config = true,
    keys = {
        { "<leader>xx", "<cmd>TroubleToggle<cr>" },
        { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
        { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
        { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
        { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },

    }
}
