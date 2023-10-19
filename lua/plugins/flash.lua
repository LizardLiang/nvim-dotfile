return {
	"folke/flash.nvim",
	keys = { "<leader>hf", "f", "R", "v" },
	opts = {},
	config = function()
		local flash = require("flash")
		local keymap = vim.keymap

		keymap.set({ "n", "x", "o" }, "<leader>hf", function()
			flash.jump()
		end, { silent = true })

		keymap.set({ "n", "x", "o" }, "<leader>hF", function()
			flash.treesitter()
		end, { desc = "[H]op [F]lash", silent = true })

		keymap.set({ "o" }, "<leader>hr", function()
			flash.remote()
		end, { desc = "[H]op Flash [R]emote", silent = true })

		keymap.set({ "o", "x", "v" }, "R", function()
			flash.treesitter_search()
		end, { desc = "Flash Treesitter Search", silent = true })

		keymap.set({ "c" }, "<leader>hc", function()
			flash.toggle()
		end, { desc = "[H]op Toggle Flash Search", silent = true })
	end,
}
