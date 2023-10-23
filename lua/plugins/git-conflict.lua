return {
  "akinsho/git-conflict.nvim",
  keys = { "<leader>gt" },
  config = function()
    local git_conflict = require("git-conflict")

    git_conflict.setup({
      default_mapping = true,
      default_commands = true,
    })

    vim.keymap.set("n", "<leader>gt", "<cmd>GitConflictListQf<cr>", { noremap = true, silent = true })
  end,
}
