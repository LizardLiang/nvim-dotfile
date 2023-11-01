-- install without yarn or npm
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  keys = { { "<leader>mp", "<Cmd>MarkdownPreview<CR>" } },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
