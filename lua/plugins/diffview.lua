return {
	"sindrets/diffview.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	keys = { "<leader>dv" },
	config = function()
		require("diffview").setup({})

		vim.keymap.set("n", "<leader>dv", ":DiffviewOpen<CR>", { noremap = true, silent = true })
	end,
}
