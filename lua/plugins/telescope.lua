local M = {
    "nvim-telescope/telescope.nvim",
    event = "BufReadPre",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
        { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
        { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>" },
        { "<leader>fc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>" },
        { "<leader>fl", "<cmd>lua require('telescope.builtin').lsp_references()<cr>" },
        { "<leader>fi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>" },
        { "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics()<cr>" },
    },
    opts = function()
        local actions = require("telescope.actions")
        -- local theme = require("telescope.themes")
        return {
            pickers = {
                find_files = { hidden = true },
            },
            defaults = {
                mappings = { i = { ["<esc>"] = actions.close } },
            },

            extensions = {
                fzf = {
                    fuzzy = true,    -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
            },
        }
    end,
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("fzf")
    end,
}

return M
