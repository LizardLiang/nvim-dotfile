local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup {
  debug = true,
  on_attach = function(client, buffer)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      vim.api.nvim_command [[augroup END]]
    end
    -- if client.supports_method("textDocument/formatting") then
    --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
    --   vim.api.nvim_create_autocmd("BufWritePre", {
    --     group = augroup,
    --     buffer = buffer,
    --     callback = function()
    --       -- on 0.8, you should use vim.lsp.buf.format({ bufnr = buffer }) instead
    --       vim.lsp.buf.formatting_sync()
    --     end,
    --   })
    -- end
  end,
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.formatting.black.with({ extra_args = { "--line-length=80" } }),
    null_ls.builtins.formatting.isort
  }
}
