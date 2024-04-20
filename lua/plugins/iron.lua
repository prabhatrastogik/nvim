return {
    "Vigemus/iron.nvim",
    cmd = { "IronRepl", "IronRestart", "IronFocus", "IronHide" },
    config = function()
        local iron = require("iron.core")
        local view = require("iron.view")
        iron.setup({
            keymaps = {
                send_motion = "<Leader>rm",
                visual_send = "<Leader>rv",
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
                -- repl_open_cmd = view.split.vertical.botright(0.4)
                repl_open_cmd = view.center("40%", 30),
                ignore_blank_lines = true,
            }
        })
    end,
    keys = {
        { '<Leader>rs', '<cmd>IronRepl<cr>' },
        { '<Leader>rr', '<cmd>IronRestart<cr>' },
        { '<Leader>rf', '<cmd>IronFocus<cr>' },
        { '<Leader>rh', '<cmd>IronHide<cr>' },
    }
}
