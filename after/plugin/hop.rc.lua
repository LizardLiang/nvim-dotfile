local hop = require('hop')
local directions = require('hop.hint').HintDirection
local keymap = vim .keymap

hop.setup({})

keymap.set('n', 'f', function()
  hop.hint_char1({direction=directions.AFTER_CURSOR})
end)
keymap.set('n', 'F', function()
  hop.hint_char1({direction=directions.BEFORE_CURSOR})
end)
keymap.set('n', '<leader>hw',"<Cmd>HopWord<CR>")
keymap.set('n', '<leader>hl', "<Cmd>HopLineStart<CR>")
