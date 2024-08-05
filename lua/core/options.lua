-- options.lua
local options = {
    backup = false,            -- creates a backup file of live buffer - if true
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 2,             -- more space in the neovim command line for displaying messages
    fileencoding = "utf-8",    -- the encoding written to a file

    hlsearch = false,          -- highlight all matches on previous search pattern - if true
    incsearch = true,          -- highlight incremental search
    ignorecase = true,         -- ignore case in search patterns
    smartcase = true,          -- smart case - dont ignore case if capital letter in search string
    showmode = false,          -- Dont show mode since we have a statusline

    mouse = "a",               -- allow the mouse to be used in neovim
    pumheight = 10,            -- pop up menu height
    showtabline = 2,           -- always show tabs

    smartindent = true,        -- make indenting smarter again
    splitbelow = true,         -- force all horizontal splits to go below current window
    splitright = true,         -- force all vertical splits to go to the right of current window
    swapfile = false,          -- creates a swapfile - if true
    termguicolors = true,      -- set term gui colors (most terminals support this)
    undofile = true,           -- enable persistent undo
    updatetime = 300,          -- faster completion (4000ms default)
    writebackup = false,       -- if a file is being edited by another program, it is not allowed to be edited

    expandtab = true,          -- convert tabs to spaces
    shiftwidth = 4,            -- the number of spaces inserted for each indentation
    tabstop = 4,               -- insert 4 spaces for a tab
    softtabstop = 4,
    cursorline = true,         -- highlight the current line
    number = true,             -- set numbered lines
    relativenumber = true,     -- set relative numbered lines

    signcolumn = "yes",        -- always show the sign column, otherwise it would shift the text each time
    wrap = true,               -- display lines as one long line
    linebreak = true,          -- companion to wrap, don't split words
    scrolloff = 8,             -- minimal number of screen lines to keep above and below the cursor
    sidescrolloff = 4,         -- minimal number of screen columns either side of cursor if wrap is `false`
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Global Vars
local global_vars = {
    mapleader = " ",
    maplocalleader = " ",
    python3_host_prog = "~/.config/nvim/.venv/bin/python", -- Create venv and install pynvim
    -- npm install neovim
    -- sudo gem install neovim
    loaded_perl_provider = 0,
    loaded_ruby_provider = 0,
    -- jupytext_fmt = 'py',
    -- jupytext_style = 'hydrogen',
}

for k, v in pairs(global_vars) do
    vim.g[k] = v
end
