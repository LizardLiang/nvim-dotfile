-- Hop
return {
  "phaazon/hop.nvim",
  branch = "v2",
  event = "BufRead",
  vscode = true,
  config = function()
    local hop = require("hop")
    local directions = require("hop.hint").HintDirection
    local keymap = vim.keymap

    hop.setup({})

    keymap.set("", "f", function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR })
    end, { desc = "Find char after cursor" })
    keymap.set("", "F", function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR })
    end, { desc = "Find char before cursor" })
    keymap.set("n", "<leader>hw", "<Cmd>HopWord<CR>", { desc = "Find Word In Current Buffer" })
    keymap.set("n", "<leader>hl", "<Cmd>HopLineStart<CR>", { desc = "Find Line Start Key" })
  end,
}
