-- Diagnostics panel — shows all LSP errors, warnings, and hints in a structured list.
-- Lets you jump between issues across the project without leaving neovim.
--
-- <leader>tx  all workspace diagnostics (every file)
-- <leader>tX  diagnostics for the current buffer only
-- <leader>tl  LSP definitions / references / implementations for symbol under cursor
-- <leader>tL  location list
-- <leader>tq  quickfix list

return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = true,
    keys = {
        { "<leader>tx", "<cmd>Trouble diagnostics toggle<cr>",                          desc = "Diagnostics (workspace)" },
        { "<leader>tX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",             desc = "Diagnostics (buffer)" },
        { "<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",   desc = "LSP References / Definitions" },
        { "<leader>tL", "<cmd>Trouble loclist toggle<cr>",                              desc = "Location List" },
        { "<leader>tq", "<cmd>Trouble qflist toggle<cr>",                               desc = "Quickfix List" },
    }
}
