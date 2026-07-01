-- Extended git tooling — complements gitsigns.lua which handles per-hunk inline operations.
-- This file adds a full git TUI (lazygit) and a diff/history viewer (diffview).

return {
    -- Full-featured git TUI: stage/unstage, commit, rebase, branch management, stash
    -- Requires lazygit on PATH: brew install lazygit
    {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "LazyGit",
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Git: LazyGit TUI" },
        },
    },

    -- Side-by-side diff viewer and per-file git history browser
    -- <leader>gd  open diff of working tree vs HEAD (or any two refs)
    -- <leader>gh  show full commit history for the current file
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>",          desc = "Git: Open Diffview" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git: File History" },
        },
    },
}
