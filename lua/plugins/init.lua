return {
	"nvim-lua/plenary.nvim", -- Common utilities
	"jay-babu/mason-nvim-dap.nvim",

	-- Snippets
	"rafamadriz/friendly-snippets",
	{ "saadparwaiz1/cmp_luasnip" },

	"nvim-telescope/telescope-file-browser.nvim",
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
	},

	-- prettier this is going to be archived soon
	-- "jose-elias-alvarez/typescript.nvim",

	-- syntax highlighting for python
	-- use 'sheerun/vim-polyglot'
	"vim-python/python-syntax",
	-- use{  'wookayin/semshi', ft="python", config="vim.cmd [[UpdateRemotePlugins]]" }
	-- use{  'numirias/semshi', ft="python", config="vim.cmd [[UpdateRemotePlugins]]" }

	-- Dashboard and session manager

	-- yarp
	"roxma/vim-hug-neovim-rpc",
	{
		"roxma/nvim-yarp",
		config = function() end,
		event = "VeryLazy",
	},

	-- better cmdline
}
