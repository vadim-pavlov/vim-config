local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "folke/noice.nvim",
    },
    opts = function()
      return {
        options = {
          theme = "everforest"
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str) return str:sub(1,1) end
            }
          },
          lualine_b = { {'diff', source = diff_source}, },
          lualine_c = {
            {
              'filename',
              path = 1,
            }
          },
          lualine_x = {
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has,
            },
            {
              'filetype',
            },
          },
        },
        inactive_sections = {
          lualine_c = {
            {
              'filename',
              path = 1,
            }
          },
        },
      }
    end,
  }
}
