local util = require("conform.util")
local prettier_for_gyp = vim.deepcopy(require("conform.formatters.prettier"))
util.add_formatter_args(prettier_for_gyp, { "--parser", "json" })

return {
  "stevearc/conform.nvim",
  opts = {
    -- Formatters are automatically loaded before lazy.nvim startup
    -- Add any additional formatters here
    formatters_by_ft = {
      gyp = { "prettier_for_gyp" },
    },
    formatters = {
      prettier_for_gyp = prettier_for_gyp,
    },
  },
}
