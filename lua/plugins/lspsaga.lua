return {
	"glepnir/lspsaga.nvim", -- LSP UIs
	event = "VeryLazy",
	config = function()
		local status, saga = pcall(require, "lspsaga")
		if not status then
			return
		end

		saga.setup({
			ui = {
				winblend = 10,
				border = "rounded",
				colors = {
					-- normal_bg = '#002b36'
				},
			},
		})

		local diagnostic = require("lspsaga.diagnostic")

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		-- vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_diagnostic<CR>', opts)
		vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
		vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
		vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
		vim.keymap.set("n", "gr", "<Cmd>Lspsaga finder<CR>", opts)
		-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
		vim.keymap.set("i", "[d", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
		vim.keymap.set("n", "<F2>", "<Cmd>Lspsaga rename<CR>", opts)
		vim.keymap.set("n", "<leader>gt", "<Cmd>Lspsaga peek_type_definition<CR>", opts)
		vim.keymap.set("n", "<leader>gT", "<Cmd>Lspsaga goto_type_definition<CR>", opts)

		vim.cmd([[
  augroup FileTypeSpecificUnmap
    autocmd!
    autocmd FileType cs :lua vim.api.nvim_del_keymap('n', 'gd')
		autocmd FileType cs :lua vim.keymap.set("n", "gd", "<Cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<CR>", opts)
  augroup END
  ]])

		-- code action
		local codeaction = require("lspsaga.codeaction")
		vim.keymap.set("n", "<leader>ca", function()
			codeaction:code_action()
		end, { silent = true })
		vim.keymap.set("v", "<leader>ca", function()
			vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
			codeaction:range_code_action()
		end, { silent = true })
	end,
}
