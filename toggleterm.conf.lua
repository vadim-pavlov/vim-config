
require("toggleterm").setup{}

local Terminal  = require('toggleterm.terminal').Terminal

_G.term1 = Terminal:new({
  hidden = true,
  direction = "float"
})

_G.term2 = Terminal:new({
  hidden = true,
  direction = "float"
})

_G.term3 = Terminal:new({
  hidden = true,
  direction = "float"
})

function set_terminal_keymaps(term)
  vim.api.nvim_buf_set_keymap(0, 'n', 'q', "<cmd>close<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, 'i', '<C-c>', "<C-\\><C-n><C-c>", {noremap = true, silent = true})
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
