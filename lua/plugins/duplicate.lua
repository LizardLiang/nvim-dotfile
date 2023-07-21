return {
	-- Duplicate
	"smjonas/duplicate.nvim",
	config = function()
		local duplicate = require("duplicate")

		duplicate.setup({})
	end,
}
