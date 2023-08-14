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
--
-- restore the session for the current directory
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>sl",
-- 	[[<cmd>lua require("persistence").load()<cr>]],
--
-- 	{ desc = "Load [S]ession [L]ast" }
-- )

-- restore the last session
-- vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

-- stop Persistence => session won't be saved on exit
-- vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})

-- return {
-- 	-- Lua
-- 	"folke/persistence.nvim",
-- 	event = "BufReadPre", -- this will only start session saving when an actual file was opened
-- 	-- add any custom options here
-- 	opts = {},
-- 	config = function()
-- 		require("persistence").setup({})
-- 		local keymap = vim.keymap
-- 		-- keymap.set(
-- 		-- 	"n",
-- 		-- 	"<leader>sl",
-- 		-- 	function()
-- 		-- 		require("persistence").load()
-- 		-- 	end,
-- 		-- 	-- "<cmd>SessionManager load_current_dir_session<CR>",
-- 		-- 	{ desc = "Load [S]ession [L]ast" }
-- 		-- )
-- 		keymap.set("n", "<leader>ss", function()
-- 			require("persistence").save()
-- 		end, { desc = "[S]ave [S]ession" })
-- 	end,
-- }
