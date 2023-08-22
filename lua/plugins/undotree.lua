return {
	-- undotree
	"mbbill/undotree",
	event = "BufReadPre",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree" })
	end,
}
