return {
    {
        "GCBallesteros/NotebookNavigator.nvim",
        keys = {
            { "]h", function() require("notebook-navigator").move_cell "d" end, { desc = "Move cell down" } },
            { "[h", function() require("notebook-navigator").move_cell "u" end, { desc = "Move cell up" } },
            -- { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>",     { desc = "Run Cell" } },
            -- { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>", { desc = "Run Cell & Move" } },
        },
        dependencies = {
            "echasnovski/mini.comment",
            "Vigemus/iron.nvim", -- repl provider
            -- "anuvyklack/hydra.nvim",
        },
        event = "VeryLazy",
        opts = {},
    },
    {
        "echasnovski/mini.hipatterns",
        event = "VeryLazy",
        dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
        opts = function()
            local nn = require "notebook-navigator"

            local opts = { highlighters = { cells = nn.minihipatterns_spec } }
            return opts
        end,
    }
}
