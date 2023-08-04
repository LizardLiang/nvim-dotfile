return {
	"L3MON4D3/LuaSnip",
	version = "2.*",
	event = "VeryLazy",
	config = function()
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_lua").lazy_load({ paths = "~/AppData/Local/nvim/LuaSnip/" })
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
	build = "make install_jsregexp",
}
