-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    print("Plugin not loaded. Error:" .. nvimtree)
    return
end

-- empty setup using defaults
nvimtree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  -- filters = {
  --   dotfiles = true,
  -- },
})

-- nvim-tree keymaps --
local keymap = vim.keymap.set
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", {})   -- toggle file explorer
keymap('n', '<leader>er', ':NvimTreeRefresh<CR>', {}) -- refresh
