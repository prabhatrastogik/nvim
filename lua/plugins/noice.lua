-- Better UI for messages, cmdline, and notifications
-- Replaces the bottom cmdline with a floating popup, routes LSP progress to a corner
-- widget, and sends long messages to a split instead of an overflowing message box.
--
-- Tip: set cmdheight = 0 in core/options.lua to reclaim the blank line at the bottom;
--      noice's floating cmdline makes the native one unnecessary.

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",    -- UI primitive used internally by noice
        "rcarriga/nvim-notify",    -- notification backend (shows LSP progress, plugin messages)
    },
    opts = {
        lsp = {
            -- Let noice render hover docs and signature help with prettier markdown
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"]                = true,
                ["cmp.entry.get_documentation"]                  = true,
            },
        },
        presets = {
            bottom_search         = true,   -- keep / search anchored at the bottom (more natural)
            command_palette       = true,   -- show : cmdline in the center of the screen
            long_message_to_split = true,   -- route long messages to a split instead of a tiny popup
            inc_rename            = false,
        },
    },
}
