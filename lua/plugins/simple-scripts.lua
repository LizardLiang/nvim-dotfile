return {
  {
    "LizardLiang/simple-scripts.nvim",
    -- dir = "C:\\Users\\lizard.liang.WATCH\\AppData\\Local\\nvim\\lua\\simple-scripts",
    ft = { "c", "cpp" },
    keys = { "clg", "<leader>fC" },
    vscode = true,
    config = function()
      local script = require("simple-scripts")
      local keymap = vim.keymap
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
        "clc",
        script.cleanup_debug_messages,
        { noremap = true, silent = true, desc = "Cleanup debug message" }
      )
      keymap.set(
        "n",
        "<leader>fC",
        script.goto_css_definition,
        { noremap = true, silent = true, desc = "Goto css definition" }
      )
    end,
  },
}
