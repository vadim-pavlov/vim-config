local rgflow = require('rgflow')

rgflow.setup(
    {
        -- Set the default rip grep flags and options for when running a search via
        -- RgFlow. Once changed via the UI, the previous search flags are used for 
        -- each subsequent search (until Neovim restarts).
        cmd_flags = "--smart-case --fixed-strings --max-columns 200",

        -- Mappings to trigger RgFlow functions
        default_trigger_mappings = false,
        -- These mappings are only active when the RgFlow UI (panel) is open
        default_ui_mappings = true,
        -- QuickFix window only mapping
        default_quickfix_mappings = true,

        quickfix = {
            open_qf_cmd_or_func = function()
              vim.cmd("copen")
              vim.schedule(
                  function()
                      vim.cmd("ccl")
                      vim.cmd("cn")
                  end
              )
            end,
        },
    }
)


vim.keymap.set("n", "\\", function()
  rgflow.open()
end, { desc = "Ripgrep: Open Ripgrep" })

vim.keymap.set("n", "<leader>rr", function()
  rgflow.open("", "--max-columns 200")
end, { desc = "Ripgrep: Open Ripgrep in regexp mode" })

vim.keymap.set("n", "<leader>fw", function()
  -- Search the word under the cursor in all files inside the working directory
  rgflow.open(vim.fn.expand("<cword>"), "--word-regexp --max-columns 200")
end, { desc = "Ripgrep: Search word under cursor" })
