return {
	"jose-elias-alvarez/null-ls.nvim", -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	event = "VeryLazy",
	config = function()
		local status, null_ls = pcall(require, "null-ls")
		local ts_status, typescript = pcall(require, "typescript")
		if not status then
			return
		end

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
			})
		end

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.diagnostics.eslint_d.with({
					diagnostics_format = "[eslint] #{m}\n(#{c})",
				}),
				-- null_ls.builtins.diagnostics.fish,
				-- null_ls.builtins.diagnostics.ruff,
				null_ls.builtins.formatting.black.with({ extra_args = { "--line-length=79" } }),
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.diagnostics.pylint,
				require("typescript.extensions.null-ls.code-actions"),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							lsp_formatting(bufnr)
						end,
					})
				end
			end,
		})

		vim.api.nvim_create_user_command("DisableLspFormatting", function()
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
		end, { nargs = 0 })
	end,
}

-- {
-- local status, null_ls = pcall(require, 'null-ls')
-- if (not status) then return end
--
-- null_ls.setup {
--   debug = true,
--   on_attach = function(client, buffer)
--     if client.server_capabilities.documentFormattingProvider then
--       vim.api.nvim_command [[augroup Format]]
--       vim.api.nvim_command [[autocmd! * <buffer>]]
--       vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
--       vim.api.nvim_command [[augroup END]]
--     end
--     -- if client.supports_method("textDocument/formatting") then
--     --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
--     --   vim.api.nvim_create_autocmd("BufWritePre", {
--     --     group = augroup,
--     --     buffer = buffer,
--     --     callback = function()
--     --       -- on 0.8, you should use vim.lsp.buf.format({ bufnr = buffer }) instead
--     --       vim.lsp.buf.formatting_sync()
--     --     end,
--     --   })
--     -- end
--   end,
--   sources = {
--     null_ls.builtins.diagnostics.eslint_d.with({
--       diagnostics_format = '[eslint] #{m}\n(#{c})'
--     }),
--     null_ls.builtins.formatting.black.with({ extra_args = { "--line-length=80" } }),
--     null_ls.builtins.formatting.isort
--   }
-- }
-- }
