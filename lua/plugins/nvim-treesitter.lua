return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml", "scss", "cmake", "cpp", "css", "sql" })
    end
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    vim.filetype.add({
      extension = { mdx = "mdx" },
    })

    vim.treesitter.language.register("markdown", "mdx")
  end,
}
