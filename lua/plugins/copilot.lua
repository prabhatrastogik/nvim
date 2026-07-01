-- Copilot inline completions via the pure-Lua implementation.
-- Accept: <Tab>   Dismiss: <C-]>   Next/prev: <M-]> / <M-[>
-- See plugins/copilot-chat.lua for the AI chat interface.
return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                accept        = "<Tab>",
                accept_word   = "<M-w>",
                accept_line   = "<M-l>",
                next          = "<M-]>",
                prev          = "<M-[>",
                dismiss       = "<C-]>",
            },
        },
        panel = { enabled = false },
    },
}
