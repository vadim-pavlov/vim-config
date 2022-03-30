
local module = {}

_G.toggle_nvimtree_replacing = function()
  local view = require"nvim-tree.view"
  if view.is_visible() then
    view.close()
  else
    require"nvim-tree".open_replacing_current_buffer()
  end
end

require"nvim-tree".setup {
  view = {
    mappings = {
      list = {
        { key = "<CR>", action = "edit_in_place" }
      }
    }
  }
}

return module
