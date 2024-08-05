local lsp_group = vim.api.nvim_create_augroup('LspActions', {})
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set
local lsp_keys = {
    gD = { vim.lsp.buf.declaration, "Go to Declaration" },
    gd = { vim.lsp.buf.definition, "Go to Definition" },
    K = { vim.lsp.buf.hover, "Hover - Show Details" },
    gi = { vim.lsp.buf.implementation, "Go to Implementation" },
    gr = { vim.lsp.buf.references, "Show all References" },
    ['<space>ls'] = { vim.lsp.buf.signature_help, "Signature Help" },
    ['<space>lt'] = { vim.lsp.buf.type_definition, "Type Definitions" },
    ['<space>ln'] = { vim.lsp.buf.rename, "Rename Across" },
}


autocmd('LspAttach', {
    group = lsp_group,
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        for k, v in pairs(lsp_keys) do
            map('n', k, v[1], { buffer = ev.buf, desc = v[2] })
        end
        map({ 'n', 'v' }, '<space>lc', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Actions" })
    end,
})


autocmd('LspAttach', {
    group = lsp_group,
    -- This is where we attach the autoformatting for reasonable clients
    callback = function(args)
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local bufnr = args.buf

        if not client or not client.server_capabilities.documentFormattingProvider then
            return
        end
        autocmd('BufWritePre', {
            group = lsp_group,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format {
                    async = false,
                    filter = function(c)
                        return c.id == client.id
                    end,
                }
            end,
        })
    end,
})
