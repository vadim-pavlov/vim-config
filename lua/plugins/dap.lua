return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      {
        "igorlfs/nvim-dap-view",
        opts = {}
      },
      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
           virt_text_pos = "eol",
        },
      },
      {
        "mfussenegger/nvim-dap-python",
        config = function()
          require("dap-python").setup("python")
        end,
      },
    },

    keys = {
      { "<leader>dc", function() require("dap").continue() end, desc = "Dap: Continue" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Dap: Terminate" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Dap: Step Into" },
      { "<leader>dn", function() require("dap").step_over() end,  desc = "Dap: Step Over" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Dap: Step Out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Dap: Toggle breakpoint" },
    },

    init = function()

      local dap, dv = require("dap"), require("dap-view")
      dap.listeners.before.attach["dap-view-config"] = function()
          dv.open()
      end
      dap.listeners.before.launch["dap-view-config"] = function()
          dv.open()
      end
      dap.listeners.before.event_terminated["dap-view-config"] = function()
          dv.close()
      end
      dap.listeners.before.event_exited["dap-view-config"] = function()
          dv.close()
      end

    end,
  }
}
