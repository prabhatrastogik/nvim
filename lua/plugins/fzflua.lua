-- Fuzzy finder for files, grep, buffers, LSP symbols, and more.
-- Backed by the fzf binary for fast filtering.
--
-- <leader>ff  find files in the project
-- <leader>fg  live grep across all files
-- <leader>fb  switch between open buffers
-- <leader>fc  preview and switch colorschemes
-- <leader>fl  LSP references for symbol under cursor
-- <leader>fi  LSP implementations for symbol under cursor
-- <leader>fd  workspace diagnostics (all files)
-- <leader>fs  git status (changed files)

local fzflua = {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        { "<leader>ff", "<cmd>FzfLua files<cr>",                 desc = "Fuzzy: Find Files" },
        { "<leader>fg", "<cmd>FzfLua live_grep<cr>",             desc = "Fuzzy: Live Grep" },
        { "<leader>fb", "<cmd>FzfLua buffers<cr>",               desc = "Fuzzy: Buffers" },
        { "<leader>fc", "<cmd>FzfLua colorschemes<cr>",          desc = "Fuzzy: Colorschemes" },
        { "<leader>fl", "<cmd>FzfLua lsp_references<cr>",        desc = "Fuzzy: LSP References" },
        { "<leader>fi", "<cmd>FzfLua lsp_implementations<cr>",   desc = "Fuzzy: LSP Implementations" },
        { "<leader>fd", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Fuzzy: Workspace Diagnostics" },
        { "<leader>fs", "<cmd>FzfLua git_status<cr>",            desc = "Fuzzy: Git Status" },
    },
}

return fzflua
