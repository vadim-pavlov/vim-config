
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
