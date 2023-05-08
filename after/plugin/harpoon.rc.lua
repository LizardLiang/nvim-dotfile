local hMark = require('harpoon.mark')
local hUi = require('harpoon.ui')
local keymap = vim.keymap

keymap.set('n', '<leader>ht', function ()hUi.toggle_quick_menu()end, { noremap = true, silent = true, desc="[H]arpoon [T]oggle" })
keymap.set('n', '<leader>ha', function() hMark.add_file()end, {noremap = true , silent = true, desc="[H]arpoon [A]dd File"})
keymap.set('n', '<leader>hn', function()hUi.nav_next()end, {noremap = true, silent = true, desc="[H]arpoon [N]ext"})
keymap.set('n', '<leader>hp', function()hUi.nav_prev()end, {noremap = true, silent = true, desc="[H]arpoon [P]revious"})
