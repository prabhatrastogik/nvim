-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

telescope.setup()
telescope.load_extension 'fzf'

-- Telescope Keymaps --
local keymap = vim.keymap.set
local silent = { silent = true, noremap = true }
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", silent)  -- find files within current working directory, respects .gitignore
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", silent)   -- find string in current working directory as you type
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", silent) -- find string under cursor in current working directory
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", silent)     -- list open buffers in current neovim instance
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", silent)   -- list available help tags
