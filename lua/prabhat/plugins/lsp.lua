require("luasnip/loaders/from_vscode").lazy_load()

local lsp = require('lsp-zero').preset({
    float_border = 'rounded',
    call_servers = 'local',
    configure_diagnostics = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = {
        preserve_mappings = false,
        omit = {},
    },
    manage_nvim_cmp = {
        set_sources = 'recommended',
        set_basic_mappings = true,
        set_extra_mappings = true,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
    },
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    'tsserver',
    'rust_analyzer',
    'pylsp',
    'lua_ls',
})

lsp.setup()

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    --         'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 100
                },
                autopep8 = {
                    enabled = false
                },
                yapf = {
                    enabled = true
                },
                rope_autoimport = {
                    enabled = true
                },
                rope_completion = {
                    enabled = true,
                    eager = true
                },
                ruff = {
                    lineLength = 100
                }
            }
        }
    }
}
