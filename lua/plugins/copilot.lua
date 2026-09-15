-- Copilot inline completions via the pure-Lua implementation.
-- Accept: <Tab>   Dismiss: <C-]>   Next/prev: <M-]> / <M-[>
-- See plugins/copilot-chat.lua for the AI chat interface.
return {
    {
        "github/copilot.vim",
        lazy = false,                       -- load immediately
        config = function()
            vim.g.copilot_no_tab_map = true -- optional: disable default <Tab> mapping
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', {
                expr = true,
                silent = true,
                noremap = true
            })
        end,
    },
}
