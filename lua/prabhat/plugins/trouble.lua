-- Trouble Keymaps --
local keymap = vim.keymap.set
local silent = { silent = true, noremap = true }

keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>",silent)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",silent)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",silent)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",silent)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",silent)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",silent)
