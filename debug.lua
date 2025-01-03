local dapui = require("dapui")

dapui.setup{
    layouts = {
        {
            elements = {
                {
                    id = "repl",
                    size = 1
                },
            },
            position = "bottom",
            size = 10
        }
    },
}


require("nvim-dap-virtual-text").setup({ virt_text_pos = "eol", })

require("dap-python").setup("python")

local dap = require("dap")

dap.listeners.after.event_initialized.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close

local function dapui_focus_float(element_id)
    dapui.float_element(element_id, { enter = true, })
end

vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Dap: Continue" })
vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Dap: Terminate" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Dap: Step Into" })
vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Dap: Step Over" })
vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Dap: Step Out" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Dap: Toggle breakpoint" })

vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Dap: Set conditional breakpoint" })

vim.keymap.set("n", "<leader>dl", function()
  dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Dap: Set log point" })

vim.keymap.set("n", "<leader>de", function()
    dapui.eval(vim.fn.input("Expression: "))
end, { desc = "Dap: Input an expression to evaluate" })

vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Dap: Toggle UI" })

vim.keymap.set("n", "<leader>ds", function()
    dapui_focus_float("scopes")
end, { desc = "Dap: Show scopes" })

vim.keymap.set("n", "<leader>df", function()
    dapui_focus_float("stacks")
end, { desc = "Dap: Show Stack Frames" })

vim.keymap.set("n", "<leader>dw", function()
    dapui_focus_float("watches")
end, { desc = "Dap: Watch Expressions" })

vim.keymap.set("n", "<leader>dp", function()
    dapui_focus_float("breakpoints")
end, { desc = "Dap: Show Breakpoints" })

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
