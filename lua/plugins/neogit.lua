return {
	"TimUntersberger/neogit",
	dependencies = "nvim-lua/plenary.nvim",
	event = "VeryLazy",
	config = function()
		local neogit = require("neogit")

		neogit.setup({
			integrations = {
				diffview = true,
			},
		})

		vim.keymap.set("n", "<leader>gs", ":Neogit<CR>")
		vim.keymap.set("n", "<leader>gc", function()
			neogit.open({ "commit" })
		end)
	end,
}
