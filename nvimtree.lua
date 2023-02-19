
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

_G.toggle_nvimtree_replacing = function()
  local view = require"nvim-tree.view"
  if view.is_visible() then
    view.close()
  else
    require"nvim-tree".open_replacing_current_buffer()
    vim.cmd("setlocal nowinfixwidth")
    vim.cmd("setlocal nowinfixheight")
  end
end

require"nvim-tree".setup {
  view = {
    mappings = {
      list = {
        { key = "<CR>", action = "edit_in_place" }
      }
    }
  },
  actions = {
    change_dir = {
      enable = false
    }
  }
}

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
