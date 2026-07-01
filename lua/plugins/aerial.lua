-- Code outline / symbol navigator
-- Shows all classes, functions, and methods in a sidebar so you can jump to them quickly.
-- Especially useful in large Python files (FastAPI routers, data pipelines).
--
-- <leader>a  toggle the outline panel
-- {          jump to previous symbol in the buffer
-- }          jump to next symbol in the buffer
--
-- Note: { and } normally navigate by empty lines; aerial replaces them with symbol jumps.
return {
    "stevearc/aerial.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>a", "<cmd>AerialToggle<cr>", desc = "Toggle Code Outline" },
    },
    opts = {
        on_attach = function(bufnr)
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
        layout = {
            max_width = { 40, 0.2 },  -- at most 40 columns or 20% of window width, whichever is smaller
        },
    },
}
