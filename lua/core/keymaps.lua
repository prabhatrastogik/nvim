-- Global keymaps — loaded after VeryLazy so all plugins are available.
-- Plugin-specific keys live in each plugin's own file under keys = { ... }.
--
-- Leader key prefix conventions used throughout this config:
--   <leader>f*  fuzzy-find (fzf-lua)                 see plugins/fzflua.lua
--   <leader>g*  git extras (lazygit, diffview)        see plugins/git.lua
--   <leader>l*  LSP buffer actions                    see core/autocmds.lua
--   <leader>t*  trouble panels / neotest              see plugins/trouble.lua, testing.lua
--   <leader>d*  debugger (dap)                        see plugins/dap.lua
--   <leader>j*  jupyter / molten                      see plugins/jupyter.lua
--   <leader>p*  python (venv selector)                see plugins/venv.lua
--   <leader>c*  copilot-chat                          see plugins/copilot-chat.lua
--   <leader>a   aerial code outline                   see plugins/aerial.lua
--   <leader>e   file explorer (nvim-tree)             see plugins/nvim-tree.lua
--   <leader>ng  neogen docstring generator            see plugins/neogen.lua

local opts = { noremap = true }
local map  = vim.keymap.set


-- Window navigation (move between splits without leaving home row)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Buffer cycling
map("n", "<leader><Right>", ":bnext<CR>",     opts)
map("n", "<leader><Left>",  ":bprevious<CR>", opts)

-- Delete to the black-hole register so deleted text doesn't overwrite the clipboard (<leader>D to avoid shadowing <leader>d* debug prefix)
map({ "n", "v" }, "<leader>D", '"_d', { desc = "Delete without copy" })
map("n", "x", '"_x')

-- Move the current line / visual selection up or down and re-indent
map("n", "<leader><Up>",   "<Esc>:m .-2<cr>==",   { desc = "Move line up" })
map("n", "<leader><Down>", "<Esc>:m .+1<cr>==",   { desc = "Move line down" })


-- Visual mode --
map("v", "<", "<gv^", opts) -- stay in visual mode after indenting left
map("v", ">", ">gv^", opts) -- stay in visual mode after indenting right

map("v", "<leader><Up>",   ":m '<-2<CR>gv=gv",  { desc = "Move selection up" })
map("v", "<leader><Down>", ":m'>+1<CR>gv=gv",   { desc = "Move selection down" })
map("v", "p", '"_dP', opts) -- paste over selection without losing the current clipboard


-- Visual block --
map("x", "<leader><Up>",   ":m '<-2<CR>gv=gv", { desc = "Move block up" })
map("x", "<leader><Down>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
map("x", "p", '"_dP', opts)


-- Terminal --
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
