-- Autocommands that wire LSP capabilities into every buffer that gets a language server.
-- LspAttach fires each time an LSP client connects to a buffer (e.g. when you open a .py file
-- and ruff attaches, or open a .go file and gopls attaches).
-- All mappings here are buffer-local so they only apply when an LSP is present.

local lsp_group = vim.api.nvim_create_augroup('LspActions', {})
local autocmd   = vim.api.nvim_create_autocmd
local map       = vim.keymap.set

-- LSP navigation keys — active only in buffers with an attached language server
local lsp_keys = {
    gD            = { vim.lsp.buf.declaration,    "Go to Declaration" },
    gd            = { vim.lsp.buf.definition,     "Go to Definition" },
    K             = { vim.lsp.buf.hover,           "Hover — show type / docs" },
    gi            = { vim.lsp.buf.implementation, "Go to Implementation" },
    gr            = { vim.lsp.buf.references,     "Show all References" },
    ['<space>ls'] = { vim.lsp.buf.signature_help, "Signature Help" },
    ['<space>lt'] = { vim.lsp.buf.type_definition,"Jump to Type Definition" },
    ['<space>ln'] = { vim.lsp.buf.rename,         "Rename symbol across project" },
}

autocmd('LspAttach', {
    group = lsp_group,
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'  -- enable <C-x><C-o> omni-completion fallback

        for k, v in pairs(lsp_keys) do
            map('n', k, v[1], { buffer = ev.buf, desc = v[2] })
        end
        -- Code actions available in both normal and visual (visual = apply to selection)
        map({ 'n', 'v' }, '<space>lc', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Actions" })
    end,
})
