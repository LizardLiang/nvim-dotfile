return {
  "sudoerwx/vim-ray-so-beautiful",
  vscode = true,
  keys = {
    { "<leader>cs", ":Ray<CR>", desc = "[C]ode [S]napshot", noremap = true, silent = true, mode = { "n", "v" } },
  },
  config = function()
    vim.g.ray_options = {
      padding = "16",
      theme = "midnight",
    }
  end,
}
