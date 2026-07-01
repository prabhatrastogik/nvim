-- Python virtual environment selector
-- Lets you pick a venv from a fuzzy list and immediately updates the LSP so
-- pyright/ruff analyze the right site-packages.
--
-- <leader>pv  pick a venv (searches ~/.venvs, .venv, venv, etc.)
-- <leader>pc  reuse the last-selected venv for this project
--
-- Uses the "regexp" (v2) branch — different API from the older main branch.
return {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "ibhagwan/fzf-lua",       -- picker backend; works because fzf-lua is already installed
    },
    ft = "python",
    keys = {
        { "<leader>pv", "<cmd>VenvSelect<cr>",       desc = "Python: Select Venv" },
        { "<leader>pc", "<cmd>VenvSelectCached<cr>", desc = "Python: Use Cached Venv" },
    },
    opts = {},
}
