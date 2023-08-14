return {
	"OmniSharp/omnisharp-vim",
	filetypes = { "cs" },
	config = function()
		vim.g.OmniSharp_server_stdio = 1
		vim.g.OmniSharp_start_server = 1
		-- vim.g.OmniSharp_server_path = "C:\\Users\\lizard.liang.WATCHSOFT\\scoop\\shims\\omnisharp.exe"
		vim.g.OmniSharp_highlighting = 0
		vim.g.OmniSharp_selector_ui = "fzf"

		local keymap = vim.keymap
		keymap.set(
			"n",
			"<leader>or",
			"<cmd>OmniSharpFindUsages<cr>",
			{ desc = "[O]mniSharp [R]eferece", noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>oK",
			"<cmd>OmniSharpDocumentation<cr>",
			{ desc = "OmniSharp documentation", noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>oi",
			"<cmd>OmniSharpFindImplementation<cr>",
			{ desc = "[O]mniSharp Find [I]mplementation", noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>os",
			"<cmd>OmniSharpFindSymbol<cr>",
			{ desc = "[O]mniSharp Find [S]ymbol", noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>oa",
			"<cmd>OmniSharpGetCodeActions<cr>",
			{ desc = "[O]mniSharp [A]ction", noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>od",
			"<cmd>OmniSharpGotoDefinition<cr>",
			{ desc = "[O]mniSharp [D]efinition", noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>of",
			"<cmd>OmniSharpFindUsages<cr>",
			{ desc = "[O]mniSharp [F]ind Usage", noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>or",
			"<cmd>OmniSharpRename<cr>",
			{ desc = "[O]mniSharp [R]ename", noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>ot",
			"<cmd>OmniSharpTypeLookup<cr>",
			{ desc = "[O]mniSharp [T]ype", noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>opd",
			"<cmd>OmniSharpPreviewDefinition<cr>",
			{ desc = "[O]mniSharp [P]review [D]efinition", noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>opi",
			"<cmd>OmniSharpPreviewImplementation<cr>",
			{ desc = "[O]mniSharp [P]review [I]mplementation", noremap = true, silent = true }
		)
	end,
}
