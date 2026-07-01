-- Test runner with inline pass/fail markers and output panel
-- Run tests without leaving the editor; see results in the summary tree or output panel.
--
-- <leader>tt  run test nearest to cursor
-- <leader>tf  run all tests in the current file
-- <leader>ts  toggle the summary tree (all tests in the project)
-- <leader>to  toggle the output panel (stdout/stderr of last run)
-- <leader>td  debug nearest test — launches the debugger (nvim-dap) on the test

return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/nvim-nio",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-go",
        },
        keys = {
            { "<leader>tt", function() require("neotest").run.run() end,                     desc = "Test: Run Nearest" },
            { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,   desc = "Test: Run File" },
            { "<leader>ts", function() require("neotest").summary.toggle() end,              desc = "Test: Summary Panel" },
            { "<leader>to", function() require("neotest").output_panel.toggle() end,         desc = "Test: Output Panel" },
            { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Test: Debug Nearest" },
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        runner     = "pytest",
                        dap        = { justMyCode = false },  -- step into library code during test debugging
                    }),
                    require("neotest-go")({
                        experimental = { test_table = true }, -- show table-driven subtests in the tree
                    }),
                },
            })
        end,
    },
}
