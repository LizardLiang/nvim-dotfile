return {
	-- {
	-- 	"jcdickinson/http.nvim",
	-- 	build = "cargo build --workspace --release",
	-- },
	{
		"jcdickinson/codeium.nvim",
		enabled = false,
		event = "BufReadPre",
		dependencies = {
			-- "jcdickinson/http.nvim",
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},
}
