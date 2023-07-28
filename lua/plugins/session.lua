return {
	"Shatur/neovim-session-manager",
	config = function()
		local config = require("session_manager.config")
		local session = require("session_manager")
		local keymap = vim.keymap

		session.setup({
			autoload_mode = config.AutoloadMode.Disabled,
		})

		keymap.set(
			"n",
			"<leader>sl",
			"<cmd>SessionManager load_current_dir_session<CR>",
			{ desc = "Load [S]ession [L]ast" }
		)
	end,
}

-- return {
-- 	-- Lua
-- 	"folke/persistence.nvim",
-- 	-- event = "BufReadPre", -- this will only start session saving when an actual file was opened
-- 	keys = { "<leader>sl" },
-- 	-- add any custom options here
-- 	opt = {
-- 		dir = vim.fn.expand(vim.fn.stdpath("data") .. "\\sessions\\"),
-- 		options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" },
-- 		pre_save = function()
-- 			print("buffer saved")
-- 		end,
-- 	},
-- 	config = function()
-- 		local keymap = vim.keymap
-- 		keymap.set(
-- 			"n",
-- 			"<leader>sl",
-- 			function()
-- 				require("persistence").load()
-- 			end,
-- 			-- "<cmd>SessionManager load_current_dir_session<CR>",
-- 			{ desc = "Load [S]ession [L]ast" }
-- 		)
-- 		print(vim.fn.expand(vim.fn.stdpath("data") .. "\\sessions\\"))
-- 	end,
-- }
