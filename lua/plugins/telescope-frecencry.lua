return {
  "nvim-telescope/telescope-frecency.nvim",
  keys = { { "<leader><leader>", "<Cmd>Telescope frecency workspace=CWD<CR>" } },
  config = function()
    require("telescope").load_extension("frecency")
  end,
}
