return {
	-- Float term
	"voldikss/vim-floaterm",
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>tn", ":FloatermNew<CR>")
		keymap.set("n", "<leader>tt", ":FloatermToggle<CR>")
		keymap.set("n", "<leader>tp", ":FloatermPrev<CR>")
		keymap.set("n", "<leader>tn", ":FloatermNext<CR>")
		keymap.set("n", "<leader>tlg", ":FloatermNew --height=0.9 --width=0.8 lazygit<CR>")
	end,
}
