return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	init = function()
		-- disable rtp plugin, as we only need its queries for mini.ai
		-- In case other textobject modules are enabled, we will load them
		-- once nvim-treesitter is loaded
	end,
}
