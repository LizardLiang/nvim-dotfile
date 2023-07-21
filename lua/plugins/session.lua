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
