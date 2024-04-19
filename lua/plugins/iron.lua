return {
    "Vigemus/iron.nvim",
    config = function()
        local iron = require("iron.core")
        local view = require("iron.view")
        iron.setup({
            keymaps = {
                send_motion = "<Leader>rs",
                visual_send = "<Leader>rs",
                send_file = "<Leader>rf",
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
                repl_open_cmd = view.split.vertical.botright(0.4)
            }
        })
    end,
}
