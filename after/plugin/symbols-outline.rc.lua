local symbols_outline = require('symbols-outline').setup()
local keymap = vim.keymap

keymap.set('n', "<leader>so", "<cmd>SymbolsOutline<CR>", {silent = true, noremap = true})
