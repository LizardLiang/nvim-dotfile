return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fr", false },
    {
      "<leader>fo",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "[F]ind [O]ld files",
    },
    {
      "<leader>fl",
      function()
        require("telescope.builtin").resume()
      end,
      desc = "[F]ind [L]ast result",
    },
  },
}
