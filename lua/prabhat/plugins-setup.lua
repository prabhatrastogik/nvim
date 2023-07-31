-- Bootstrap Packer (Install if doesn't exist)
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Commonly Required Plugins
    use("nvim-lua/plenary.nvim")
    use("nvim-tree/nvim-web-devicons")
    -- NvimTree (File Explorer)
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
    --  Comment Toggler (gc)
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                ignore = "^$",
            })
        end
    }
    --  Lualine  (Bottom Status Line)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup(
                { options = { theme = 'molokai' } }
            )
        end
    }
    --  Telescope + FZF  (Fuzzy  Finder)
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) --dependency for better sorting performance
    use({ "BurntSushi/ripgrep" })                                     --suggested dependency for live_grep
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = { { 'nvim-lua/plenary.nvim' } }
    })
    -- Treesitter interface
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({
                with_sync = true
            })
        end
    }
    -- ColorSchemes
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use 'folke/tokyonight.nvim'
    use { 'EdenEast/nightfox.nvim', config = function()
        vim.cmd('colorscheme ' .. 'nightfox')
    end
    }
    use 'projekt0n/github-nvim-theme'
    -- ToggleTerm
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup {
            open_mapping = '<leader>t',
            direction = 'vertical',
            insert_mappings = false,
            shade_terminals = true,
            size = 40,
        }
    end }
    --  LSP Setup with LSP-Zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(function() vim.cmd [['MasonUpdate']] end)
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'rafamadriz/friendly-snippets' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    -- GitSigns
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    })
    -- Trouble (For diagnostics tracking)
    use({
        "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
    })
    -- Help
    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    -- REPL
    use { 'Vigemus/iron.nvim' }
    -- UI Enhancements
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup {
                show_end_of_line = true,
                space_char_blankline = " ",
            }
        end
    }
    use { 'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup {}
        end
    }
    use { 'RRethy/vim-illuminate' }
    -- use {
    --     "startup-nvim/startup.nvim",
    --     requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    --     config = function()
    --         require 'startup'.setup({ theme = "dashboard" })
    --     end
    -- }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
