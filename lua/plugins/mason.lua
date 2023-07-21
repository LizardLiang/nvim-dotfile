return {
	"williamboman/mason.nvim",
	config = function()
		local status, mason = pcall(require, "mason")
		if not status then
			return
		end
		local status2, lspconfig = pcall(require, "mason-lspconfig")
		if not status2 then
			return
		end

		mason.setup({})

		lspconfig.setup({
			automatic_installation = true,
		})

		lspconfig.setup_handlers({
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({})
			end,
		})
	end,
}
