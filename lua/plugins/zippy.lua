-- debug print
return {
  "PatschD/zippy.nvim",
  keys = "clg",
  config = function()
    local zippy = require("zippy")

    zippy.setup({
      ["python"] = {
        print_function = "logger.debug",
      },
    })

    vim.keymap.set("n", "clg", "<cmd>lua require('zippy').insert_print()<CR>")
  end,
}
