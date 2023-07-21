return {
	"theHamsta/nvim-dap-virtual-text",
	config = function()
		local dap_virtual_text = require("nvim-dap-virtual-text")

		dap_virtual_text.setup({
			enabled = true,
			enable_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = false,
			show_stop_reason = true,
			commented = false,
			only_first_definition = true,
			all_references = false,
			filter_references_pattern = "<module",
			virt_text_pos = "eol",
			all_frames = false,
			virt_lines = false,
			virt_text_win_col = nil,
		})
	end,
}
