-- AI chat window backed by your Copilot subscription
-- Works alongside copilot.vim (inline completions); this adds a conversation interface
-- where you can ask questions, get explanations, and request code changes.
--
-- Select code in visual mode before using the action keys for context-aware responses.
--
-- <leader>cc  open / close the chat panel
-- <leader>ce  explain the selected code
-- <leader>cr  review the selection for bugs and issues
-- <leader>cf  ask Copilot to fix the selected code
-- <leader>ct  generate tests for the selection

return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        "zbirenbaum/copilot.lua",
        "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",
    cmd = { "CopilotChat", "CopilotChatToggle" },
    keys = {
        { "<leader>cc", "<cmd>CopilotChatToggle<cr>",  desc = "Copilot: Toggle Chat" },
        { "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" },          desc = "Copilot: Explain" },
        { "<leader>cr", "<cmd>CopilotChatReview<cr>",  mode = { "n", "v" },          desc = "Copilot: Review" },
        { "<leader>cf", "<cmd>CopilotChatFix<cr>",     mode = { "n", "v" },          desc = "Copilot: Fix" },
        { "<leader>ct", "<cmd>CopilotChatTests<cr>",   mode = { "n", "v" },          desc = "Copilot: Generate Tests" },
    },
    opts = {
        window             = {
            layout = "vertical",
            width  = 0.4, -- 40% of screen width
        },
        show_help          = true,
        auto_follow_cursor = false, -- don't scroll the chat buffer as cursor moves in code
    },
}
