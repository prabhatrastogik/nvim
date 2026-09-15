-- Editor settings applied before plugins load so plugins can read them.

local options = {
    backup = false,             -- don't litter the filesystem with .bak files
    clipboard = "unnamedplus", -- sync y/p with the OS clipboard (requires xclip/pbcopy)
    cmdheight = 1,             -- set to 0 if using noice.nvim to reclaim the bottom line
    fileencoding = "utf-8",

    hlsearch = false,          -- clear search highlights automatically (toggle with :noh if needed)
    incsearch = true,          -- highlight matches as you type the search pattern
    ignorecase = true,         -- case-insensitive search by default ...
    smartcase = true,          -- ... unless the query contains a capital letter
    showmode = false,          -- lualine already shows INSERT/NORMAL/VISUAL in the statusline

    mouse = "a",               -- enable mouse in all modes (resize splits, scroll, click)
    pumheight = 10,            -- limit the completion popup to 10 visible items
    showtabline = 2,           -- always show the tabline (lualine uses it to display open buffers)

    smartindent = true,        -- auto-indent new lines following the current line's syntax
    splitbelow = true,         -- horizontal splits open below the current window
    splitright = true,         -- vertical splits open to the right
    swapfile = false,          -- no .swp files; undofile handles crash recovery
    termguicolors = true,      -- 24-bit colour (required by catppuccin and most modern plugins)
    undofile = true,           -- persist undo history across sessions (~/.local/share/nvim/undo)
    updatetime = 300,          -- ms until CursorHold fires — controls gitsigns and LSP hover latency
    writebackup = false,       -- don't create a pre-write backup (undofile is the safety net)

    expandtab = true,          -- <Tab> inserts spaces instead of a tab character
    shiftwidth = 4,            -- columns per indent level (>>, <<, auto-indent)
    tabstop = 4,               -- visual width of an actual tab character in the file
    softtabstop = 4,           -- backspace deletes this many spaces at once

    cursorline = true,         -- highlight the row the cursor is on
    number = true,             -- show the absolute line number in the gutter
    relativenumber = true,     -- show relative numbers on all other lines (fast 5j / 12k jumps)

    signcolumn = "yes",        -- always reserve gutter space for signs so text doesn't shift
    wrap = true,               -- soft-wrap long lines (does not modify the file)
    linebreak = true,          -- wrap at word boundaries instead of mid-word
    scrolloff = 8,             -- keep 8 lines visible above and below the cursor when scrolling
    sidescrolloff = 4,         -- keep 4 columns visible left/right when scrolling horizontally
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Global variables read by Neovim core and certain plugins at startup
local global_vars = {
    mapleader      = " ",    -- Space as the leader key
    maplocalleader = " ",
    python3_host_prog = vim.fn.expand("~/.config/nvim/.venv/bin/python"), -- Create venv and install pynvim
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

-- Teach Neovim about compound/non-standard filetypes so LSP servers that register
-- them (yamlls, gopls) don't produce "Unknown filetype" warnings in :checkhealth.
vim.filetype.add({
    extension = {
        tmpl   = "gotmpl",   -- Go text/html templates
        gotmpl = "gotmpl",
        mdx    = "mdx",      -- MDX (Markdown + JSX)
        ejs    = "ejs",      -- EJS templates
        pcss   = "postcss",  -- PostCSS
        njk    = "njk",      -- Nunjucks
    },
    filename = {
        ["docker-compose.yml"]  = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"]         = "yaml.docker-compose",
        ["compose.yaml"]        = "yaml.docker-compose",
        [".gitlab-ci.yml"]      = "yaml.gitlab",
    },
    pattern = {
        ["docker%-compose%..*%.ya?ml"] = "yaml.docker-compose",
        [".*/templates/.*%.ya?ml"]     = "yaml.helm-values",
        ["values%..*%.ya?ml"]          = "yaml.helm-values",
    },
})
