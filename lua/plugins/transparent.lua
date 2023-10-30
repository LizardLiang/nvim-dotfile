return {
  -- Styling
  "xiyaowong/transparent.nvim",
  -- enabled = false,
  config = function()
    local transparent = require("transparent")
    vim.g.transparent_enable = 1
  end,
}
