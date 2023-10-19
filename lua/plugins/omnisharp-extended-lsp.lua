return {
	"Hoffs/omnisharp-extended-lsp.nvim",
	ft = { "cs" },
	config = function()
		local pid = vim.fn.getpid()

		local omnisharp_bin =
			"C:\\Users\\lizard.liang.WATCHSOFT\\AppData\\Local\\nvim-data\\mason\\packages\\omnisharp\\libexec\\OmniSharp.exe"

		local config = {
			handlers = {
				["textDocument/definition"] = require("omnisharp_extended").handler,
			},
			cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
		}

		require("lspconfig").omnisharp.setup(config)
	end,
}
