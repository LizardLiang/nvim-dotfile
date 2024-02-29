return {
  "craftzdog/solarized-osaka.nvim",
  enabled = false,
  lazy = true,
  priority = 1000,
  opts = function()
    return {
      transparent = true,
    }
  end,
  config = function()
    vim.cmd("colorscheme solarized-osaka")
  end,
}
