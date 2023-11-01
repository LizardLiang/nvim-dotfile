return {
  "LizardLiang/simple-scripts.nvim",
  ft = { "c", "cpp" },
  keys = { "clg", "<leader>fC" },
  vscode = true,
  config = function()
    local keymap = vim.keymap
    local script = require("simple-scripts")
    keymap.set(
      "n",
      "<leader>tf",
      require("simple-scripts").toggle,
      { noremap = true, silent = true, desc = "[T]oggle [F]ile" }
    )
    keymap.set(
      "n",
      "<leader>tg",
      script.generate_cpp_header,
      { noremap = true, silent = true, desc = "Generate function definition" }
    )
    keymap.set(
      "n",
      "clg",
      script.insert_debug_message,
      { noremap = true, silent = true, desc = "Insert debug message" }
    )
    keymap.set(
      "n",
      "<leader>fC",
      script.goto_css_definition,
      { noremap = true, silent = true, desc = "Goto css definition" }
    )
  end,
}
