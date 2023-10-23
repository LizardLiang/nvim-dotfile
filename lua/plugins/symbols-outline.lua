-- Symbol outlines
return {
  "simrat39/symbols-outline.nvim",
  event = "BufReadPre",
  config = function()
    local symbols_outline = require("symbols-outline").setup()
    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>so",
      "<cmd>SymbolsOutline<CR>",
      { silent = true, noremap = true, desc = "[S]ymbols [O]utine" }
    )
  end,
}
