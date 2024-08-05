local opts = { noremap = true } --,silent = true }
local map = vim.keymap.set


-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
map("n", "<leader><Right>", ":bnext<CR>", opts)
map("n", "<leader><Left>", ":bprevious<CR>", opts)

-- Command Cleanups
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without copy" })

-- Copy corrections
map("n", "x", '"_x')

-- Move Lines
map({ "n" }, "<leader><Up>", "<Esc>:m .-2<cr>==", { desc = "Move up" })
map({ "n" }, "<leader><Down>", "<Esc>:m .+1<cr>==", { desc = "Move down" })


-- Visual --
-- Stay in indent mode
map("v", "<", "<gv^", opts)
map("v", ">", ">gv^", opts)

-- Move text up and down
map("v", "<leader><Up>", ":m '<-2<CR>gv=gv", { desc = "Move up" })
map("v", "<leader><Down>", ":m'>+1<CR>gv=gv", { desc = "Move down" })
map("v", "p", '"_dP', opts)


-- Visual Block --
-- Move text up and down
map("x", "<leader><Up>", ":m '<-2<CR>gv=gv", { desc = "Move up" })
map("x", "<leader><Down>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
map("x", "p", '"_dP', opts)


-- Terminal Mode --
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal" })
