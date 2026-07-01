-- Debugging via Debug Adapter Protocol (DAP)
-- Workflow: set breakpoints → <F5> start → <F10> step over → <F11> step into → <leader>dbu inspect vars
--
-- Python adapter: uses debugpy, auto-installed by mason (pip install debugpy in each project venv too)
-- Go adapter:     uses delve  (go install github.com/go-delve/delve/cmd/dlv@latest)

return {
    -- Core DAP client — connects neovim to language-specific debug adapters
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<F5>",       function() require("dap").continue() end,          desc = "Debug: Continue / Start" },
            { "<F9>",       function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
            { "<F10>",      function() require("dap").step_over() end,         desc = "Debug: Step Over" },
            { "<F11>",      function() require("dap").step_into() end,         desc = "Debug: Step Into" },
            { "<F12>",      function() require("dap").step_out() end,          desc = "Debug: Step Out" },
            { "<leader>dbr", function() require("dap").repl.open() end,         desc = "Debug: Open REPL" },
            { "<leader>dbl", function() require("dap").run_last() end,          desc = "Debug: Run Last Config" },
        },
    },

    -- UI panels: variables, call stack, breakpoints, watches
    -- Opens automatically when a session starts; close with <leader>du or when session ends
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        keys = {
            { "<leader>dbu", function() require("dapui").toggle() end, desc = "Debug: Toggle UI" },
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            -- Auto-open the UI when a session starts and close it when the session ends
            dap.listeners.after.event_initialized["dapui_config"]  = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"]  = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close() end
        end,
    },

    -- Python debugger — uses debugpy, respects the active virtual environment
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            -- Prefer the active venv's python (set by venv-selector or shell activation)
            -- so the debugger runs in the same environment as the code
            local venv_python = (os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "") .. "/bin/python"
            local python = vim.fn.executable(venv_python) == 1 and venv_python or vim.fn.exepath("python3")
            require("dap-python").setup(python)
        end,
    },

    -- Go debugger — wraps delve; install with: go install github.com/go-delve/delve/cmd/dlv@latest
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dap-go").setup()
        end,
    },
}
