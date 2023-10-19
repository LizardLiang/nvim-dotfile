return {
  -- Duplicate
  "smjonas/duplicate.nvim",
  keys = { "ydd" },
  config = function()
    local duplicate = require("duplicate")

    duplicate.setup({})
  end,
}
