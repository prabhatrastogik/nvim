-- Bootstrap lazy.nvim (the plugin manager) if it is not already on disk, then hand off
-- to it to auto-discover and load every file under lua/plugins/.
--
-- defaults.lazy = true  means every plugin loads on-demand (triggered by cmd/event/ft/keys)
-- unless a plugin explicitly opts out with lazy = false.
-- checker.enabled = true  makes lazy.nvim notify you when any plugin has an update.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    defaults = { lazy = true },
    ui = {
        border = "rounded",
    },
    checker = { enabled = true },
    debug = false,
    rocks = { enabled = false, hererocks = false }
})
