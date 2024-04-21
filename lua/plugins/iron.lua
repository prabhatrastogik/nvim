return {
    "Vigemus/iron.nvim",
    dependencies = 'which-key.nvim',
    cmd = { "IronRepl", "IronRestart", "IronFocus", "IronHide" },
    init = function()
        vim.keymap.set('n', '<leader>rs', '<cmd>IronRepl<cr>')
        vim.keymap.set('n', '<leader>rr', '<cmd>IronRestart<cr>')
        vim.keymap.set('n', '<leader>rf', '<cmd>IronFocus<cr>')
        vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<cr>')
    end,
    config = function()
        local iron = require("iron.core")
        local view = require("iron.view")
        iron.setup({
            keymaps = {
                send_motion = "<Leader>rm",
                visual_send = "<Leader>rv",
                send_file = "<Leader>rb", -- send buffer
                send_line = "<Leader>rl",
                -- send_until_cursor = "<Leader>su",
                -- send_mark = "<Leader>sm",
                -- mark_motion = "<Leader>mc",
                -- mark_visual = "<Leader>mc",
                -- remove_mark = "<Leader>md",
                cr = "<Leader>r<cr>",
                interrupt = "<Leader>ri",
                exit = "<Leader>rq",
                clear = "<Leader>rc",
            },
            config = {
                repl_open_cmd = view.split.vertical(0.35),
                -- repl_open_cmd = view.center("40%", 30),
                ignore_blank_lines = true,
            }
        })
    end,
}
