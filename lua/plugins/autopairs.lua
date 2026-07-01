-- Auto-close brackets, quotes, and parens as you type.
-- check_ts = true means treesitter is used to decide whether to close a delimiter
-- (e.g. it won't double-close inside a string literal).
-- The cmp integration ensures the closing delimiter is removed if you accept a
-- completion item that already includes it.

local M = {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        check_ts = true,
    },
    config = function(_, opts)
        require("nvim-autopairs").setup(opts)

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local ok, cmp = pcall(require, "cmp")
        if ok then
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    end,
}

return M
