-- Jupyter / REPL integration via molten-nvim
-- Run Python code cells inline and see output (text, errors, dataframes) below the code —
-- like a notebook experience inside the normal editor, without leaving the .py file.
--
-- One-time setup (per project venv):
--   pip install pynvim jupyter_client ipykernel
--   :UpdateRemotePlugins        ← run once in neovim after first install
--
-- Typical workflow:
--   <leader>ji  →  attach to a running Jupyter kernel (or start one via :!jupyter kernel)
--   <leader>jl  →  evaluate the current line
--   <leader>jv  →  evaluate visual selection (select a cell block, then <leader>jv)
--   <leader>jo  →  show output for the cell under cursor
--   <leader>jr  →  restart the kernel
--
-- For inline plot rendering (matplotlib etc.) install image.nvim and a supported terminal
-- (Kitty or Ghostty), then change molten_image_provider to "image.nvim".

return {
    {
        "benlubas/molten-nvim",
        build = ":UpdateRemotePlugins",
        ft    = "python",
        init  = function()
            vim.g.molten_image_provider        = "none"   -- swap to "image.nvim" for plot output
            vim.g.molten_output_win_max_height = 20       -- cap output window height
            vim.g.molten_auto_open_output      = false    -- don't pop the output window on every eval
            vim.g.molten_virt_text_output      = true     -- show a one-line preview in virtual text
            vim.g.molten_virt_lines_off_by_1   = true     -- align virtual text with the output window
        end,
        keys = {
            { "<leader>ji", "<cmd>MoltenInit<cr>",         desc = "Jupyter: Init Kernel" },
            { "<leader>jl", "<cmd>MoltenEvaluateLine<cr>", desc = "Jupyter: Evaluate Line" },
            { "<leader>jo", "<cmd>MoltenShowOutput<cr>",   desc = "Jupyter: Show Output" },
            { "<leader>jd", "<cmd>MoltenDelete<cr>",       desc = "Jupyter: Delete Cell Output" },
            { "<leader>jr", "<cmd>MoltenRestart<cr>",      desc = "Jupyter: Restart Kernel" },
            {
                "<leader>jv",
                ":<C-u>MoltenEvaluateVisual<cr>",
                mode = "v",
                desc = "Jupyter: Evaluate Visual Selection",
            },
        },
    },
}
