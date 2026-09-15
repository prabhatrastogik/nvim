-- Treesitter: parser management for Neovim 0.12+.
-- Highlighting, indent, and selection are now built into Neovim via vim.treesitter.
-- This plugin only handles parser installation and updates.

local M = {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query", "elixir", "heex",
                "javascript", "html", "python", "go", "typescript",
                "rust", "dockerfile", "json", "yaml", "markdown", "css"
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = true },
        })
    end
}

return M
