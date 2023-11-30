return {
  "matbme/JABS.nvim",
  keys = {

    { "<leader>jb", "<cmd>JABSOpen<cr>", { desc = "Open buffer switch" } },
  },
  config = function()
    require("jabs").setup()
  end,
}
