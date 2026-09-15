-- Entry point — load order matters:
--   1. options     sets vim.opt / vim.g before plugins can read them
--   2. plugins     bootstraps lazy.nvim and registers every plugin spec from lua/plugins/
--   3. colorscheme applied immediately after plugins register so there is no flash of default colors
--   4. keymaps / autocmds deferred to VeryLazy so every plugin is guaranteed to be loaded first

require("core.options")
require("core.autocmds")
require("core.keymaps")
require("plugins-setup")

vim.cmd.colorscheme "catppuccin-frappe"

