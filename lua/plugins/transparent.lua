return {
	-- Styling
	"xiyaowong/transparent.nvim",
	config = function()
		local transparent = require("transparent")

		vim.g.transparent_enable = 1
	end,
}
