-- Code formatter — runs formatters on save, per filetype.
-- conform is preferred over LSP formatting because it supports multiple formatters per filetype
-- and is faster. lsp_format = "fallback" means: use the LSP formatter only if no conform
-- formatter is configured for that filetype.
--
-- Formatters must be installed separately (mason installs most of them via :MasonInstall):
--   stylua       Lua              (brew install stylua  or  cargo install stylua)
--   ruff         Python           (pip install ruff  or  brew install ruff)
--   prettierd    JS/TS            (npm install -g @fsouza/prettierd)
--   gofumpt      Go               (go install mvdan.cc/gofumpt@latest)
--   sqlfluff     SQL              (pip install sqlfluff)
--   shfmt        Shell            (brew install shfmt  or  go install mvdan.cc/sh/v3/cmd/shfmt@latest)
--
-- <leader>fo  format the current buffer manually (async, won't block)

return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd   = { "ConformInfo" },
    keys  = {
        {
            "<leader>fo",
            function() require("conform").format({ async = true }) end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua        = { "stylua" },
            python     = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            go         = { "gofumpt" },
            sql        = { "sqlfluff" },
            sh         = { "shfmt" },
            bash       = { "shfmt" },
        },
        default_format_opts = {
            lsp_format = "fallback",  -- use LSP formatter only when conform has no formatter for the ft
        },
        format_on_save = { timeout_ms = 500 },
        formatters = {
            shfmt = {
                prepend_args = { "-i", "2" },  -- 2-space indent for shell scripts
            },
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
