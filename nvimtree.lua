
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

_G.toggle_nvimtree_replacing = function()
  local tree = require"nvim-tree.api".tree
  if tree.is_visible() then
    tree.close()
  else
    tree.open({
      path = vim.fn.expand('%:p:h'),
      current_window = true,
      find_file = true,
    })
    vim.cmd("setlocal nowinfixwidth")
    vim.cmd("setlocal nowinfixheight")
  end
end

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', '<CR>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
end

require"nvim-tree".setup {
  on_attach = my_on_attach,
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
