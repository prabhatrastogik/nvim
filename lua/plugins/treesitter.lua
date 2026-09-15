-- Treesitter: parser management for Neovim 0.12+.
-- Highlighting, indent, and selection are now built into Neovim via vim.treesitter.
-- This plugin only handles parser installation and updates.

local M = {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {
            "c", "lua", "vim", "vimdoc", "query", "elixir", "heex",
            "javascript", "html", "python", "go", "typescript",
            "rust", "dockerfile", "json", "yaml", "markdown", "css"
        },
        auto_install = true,
    },
    config = function(_, opts)
        require("nvim-treesitter").setup(opts)
    end,
}

return M
