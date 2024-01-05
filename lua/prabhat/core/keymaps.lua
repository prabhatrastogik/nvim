local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader><Right><Right>", "<C-w>l", opts)
keymap("n", "<leader><Left><Left>", "<C-w>h", opts)
keymap("n", "<leader><Up><Up>", "<C-w>k", opts)
keymap("n", "<leader><Down><Down>", "<C-w>j", opts)

-- Navigate buffers
keymap("n", "<leader><Right>", ":bnext<CR>", opts)
keymap("n", "<leader><Left>", ":bprevious<CR>", opts)

-- Command Cleanups
keymap({ "n", "v" }, "<leader>d", '"_d')

-- Copy corrections
keymap("n", "x", '"_x')

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<leader><Up>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<leader><Down>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<leader><Up>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<leader><Down>", ":m '<-2<CR>gv=gv", opts)
keymap("x", "p", '"_dP', opts)
