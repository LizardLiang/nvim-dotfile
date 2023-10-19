return {
  "kylechui/nvim-surround",
  keys = { "d", "c", "y", "v" },
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}
