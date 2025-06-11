local fzflua = {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        { "<leader>ff", "<cmd>FzfLua files<cr>",                 desc = "Fuzzy find files" },
        { "<leader>fg", "<cmd>FzfLua live_grep<cr>",             desc = "Fuzzy grep files" },
        { "<leader>fb", "<cmd>FzfLua buffers<cr>",               desc = "Fuzzy search opened buffers" },
        { "<leader>fc", "<cmd>FzfLua colorschemes<cr>",          desc = "ColorSchemes" },
        { "<leader>fl", "<cmd>FzfLua lsp_references<cr>",        desc = "LSP References" },
        { "<leader>fi", "<cmd>FzfLua lsp_implementations<cr>",   desc = "LSP Implementation" },
        { "<leader>fd", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Diagnostics" },
        { "<leader>fg", "<cmd>FzfLua git_status<cr>",            desc = "Git Status" },
    },

}

return fzflua
