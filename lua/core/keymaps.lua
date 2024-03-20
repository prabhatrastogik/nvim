local opts = { noremap = true } --,silent = true }
local keymap = vim.keymap.set


-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Select all
-- keymap("n", "<C-a>", "ggVG<cr>", opts)

-- Save file
keymap({ "v", "n" }, "<C-s>", "<cmd>w<cr><esc>", opts)

-- Close buffer
vim.keymap.set({ "v", "n" }, "<C-w>", "<cmd>bd<cr><esc>", { desc = "Close buffer" })

-- Close folder
vim.keymap.set({ "v", "n" }, "<C-q>", "<cmd>q!<cr>", { desc = "Close buffer" })

-- Navigate buffers
keymap("n", "<leader><Right>", ":bnext<CR>", opts)
keymap("n", "<leader><Left>", ":bprevious<CR>", opts)

-- Command Cleanups
keymap({ "n", "v" }, "<leader>d", '"_d')

-- Copy corrections
keymap("n", "x", '"_x')

-- Move Lines
keymap({ "n" }, "<leader><Up>", "<Esc>:m .-2<cr>==", { desc = "Move down" })
keymap({ "n" }, "<leader><Down>", "<Esc>:m .+1<cr>==", { desc = "Move down" })


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<leader><Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<leader><Down>", ":m'>+1<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)


-- Visual Block --
-- Move text up and down
keymap("x", "<leader><Up>", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<leader><Down>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "p", '"_dP', opts)
