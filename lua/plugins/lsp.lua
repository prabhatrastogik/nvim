-- LSP servers, completion engine, and snippets
--
-- Server management:
--   mason.nvim           installs/updates LSP servers, linters, and formatters via :Mason
--   mason-lspconfig      bridges mason with nvim-lspconfig; ensure_installed auto-installs these servers
--
-- New (Neovim 0.11+) LSP API:
--   vim.lsp.config[name] sets per-server config (capabilities, settings, init_options)
--   vim.lsp.enable(list) activates the configured servers — replaces the old lspconfig[name].setup() call
--
-- Completion stack:
--   nvim-cmp             completion engine that aggregates sources
--   cmp-nvim-lsp         LSP suggestions (highest priority)
--   cmp-path             filesystem paths
--   cmp-buffer           words from open buffers
--   LuaSnip              snippet engine; friendly-snippets provides a VS Code snippet library
--
-- Language coverage:
--   ruff      Python linting + import sorting (fast, Rust-based); does NOT do type checking
--             → add basedpyright to lsps[] for static type analysis
--   pyright   commented out — re-enable or switch to basedpyright for type checking
--   gopls     Go — full-featured: completions, types, imports, refactoring
--   ts_ls     TypeScript / JavaScript
--   lua_ls    Lua — configured to know about the vim global so nvim config editing works
--   clangd    C / C++
--   tailwindcss, cssls, html, graphql, jsonls, yamlls, taplo, bashls — web / config files

local lsps = {
    "clangd",
    "ts_ls",
    -- "pyright",     -- uncomment (or replace with "basedpyright") for Python type checking
    "ruff",
    "lua_ls",
    "bashls",
    "yamlls",
    "jsonls",
    "cssls",
    "taplo",
    "html",
    "graphql",
    "tailwindcss",
    "gopls",
}

return {
    -- Installs and manages LSP servers, DAP adapters, linters, and formatters
    {
        'williamboman/mason.nvim',
        build = ":MasonUpdate",
        config = true,
        lazy = false,
    },
    -- Ensures the servers in the lsps list above are installed when mason starts
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        opts = {
            ensure_installed = lsps
        }
    },
    -- Snippet engine; friendly-snippets provides a large VS Code-compatible snippet library
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },

    -- LSP client configuration
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            -- Advertise nvim-cmp's extended capabilities to every server so it knows
            -- to send completion items in the richer format cmp expects
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Apply the enhanced capabilities to every server in the list
            for _, lsp in ipairs(lsps) do
                vim.lsp.config[lsp] = { capabilities = capabilities }
            end

            -- lua_ls needs extra config to understand the neovim runtime environment
            vim.lsp.config.lua_ls = {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },           -- don't warn on 'vim' global
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),  -- neovim runtime files
                        },
                        telemetry = { enable = false },
                    },
                },
            }

            -- ruff: linting + import organisation (formatting handled by conform.nvim)
            vim.lsp.config.ruff = {
                capabilities = capabilities,
                init_options = {
                    settings = {
                        lineLength      = 100,
                        organizeImports = true,
                    }
                }
            }

            vim.lsp.enable(lsps)
        end
    },

    -- Completion engine — assembles suggestions from multiple sources
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",   -- LSP suggestions
            "hrsh7th/cmp-path",       -- filesystem paths
            "hrsh7th/cmp-buffer",     -- words from open buffers
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-cmdline",    -- completion in : and / prompts
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp     = require("cmp")
            local luasnip = require("luasnip")

            -- Load snippets from friendly-snippets (VS Code format)
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip', keyword_length = 2 },
                    { name = 'buffer',  keyword_length = 3 },
                },
                window = {
                    completion    = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args) luasnip.lsp_expand(args.body) end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"]     = cmp.mapping.scroll_docs(4),
                    ["<C-u>"]     = cmp.mapping.scroll_docs(-4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"]     = cmp.mapping.close(),
                    ["<CR>"]      = cmp.mapping.confirm({ select = true }),
                    -- Tab: cycle completion items; also jump through snippet placeholders
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.jumpable(1) then
                            luasnip.jump(1)
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
            })

            -- Completion in the / search prompt (buffer words)
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = 'buffer' } }
            })

            -- Completion in the : command prompt (paths + commands)
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } }
                })
            })
        end
    },
}
