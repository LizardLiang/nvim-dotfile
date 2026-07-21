return {
  {
    "LizardLiang/NoVim",
    dir = "C:\\Users\\lizard_liang\\personal\\nvim-plugin\\NoVim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "NoVim", "NoVimUrl" },
    keys = { "<leader>nv" },
    config = function()
      require("novim").setup({
        sidebar_width = 40,
        word_wrap = true,
        keymaps = {
          next_chapter = "]c",
          prev_chapter = "[c",
          toggle_sidebar = "<leader>nv",
        },
      })
    end,
  },
}
