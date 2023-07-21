return {
	"akinsho/nvim-bufferline.lua",
	config = function()
		local status, bufferline = pcall(require, "bufferline")
		if not status then
			return
		end

		bufferline.setup({
			options = {
				mode = "tabs",
				separator_style = "slant",
				always_show_bufferline = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
			},
			highlights = {
				separator = {
					fg = "#2c3043",
					bg = "#363646",
				},
				separator_selected = {
					fg = "#2c3043",
				},
				background = {
					fg = "#657b83",
					bg = "#363646",
				},
				buffer_selected = {
					fg = "#fdf6e3",
					bold = true,
				},
				fill = {
					bg = "#2c3043",
				},
			},
		})

		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
	end,
}
