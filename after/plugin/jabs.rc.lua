local jabs = require('jabs')
local keymap = vim.keymap

jabs. setup ({
  position = {'right', 'bottom'}
})

keymap.set('n', '<leader>jb', '<cmd>JABSOpen<CR>', {desc="[J]ABS [O]pen"})
