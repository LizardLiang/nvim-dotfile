local hop = require("hop")
local directions = require("hop.hint").HintDirection
local keymap = vim.keymap

hop.setup({})

keymap.set("n", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR })
end, { desc = "Find char after cursor" })
keymap.set("n", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR })
end, { desc = "Find char before cursor" })
keymap.set("n", "<leader>hw", "<Cmd>HopWord<CR>", { desc = "Find Word In Current Buffer" })
keymap.set("n", "<leader>hl", "<Cmd>HopLineStart<CR>", { desc = "Find Line Start Key" })
