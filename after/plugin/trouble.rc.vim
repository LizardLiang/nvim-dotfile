lua << EOF
  require("trouble").setup{
    mode = "quickfix",
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    use_lsp_diagnostic_signs = false
  }
EOF
