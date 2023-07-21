return {
	-- Styling
	"xiyaowong/transparent.nvim",

	"nvim-lua/plenary.nvim", -- Common utilities
	"jay-babu/mason-nvim-dap.nvim",

	-- Snippets
	"rafamadriz/friendly-snippets",
	{ "saadparwaiz1/cmp_luasnip" },

	"kyazdani42/nvim-web-devicons", -- File icons
	"nvim-telescope/telescope-file-browser.nvim",
	"windwp/nvim-autopairs",
	"norcalli/nvim-colorizer.lua",
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
	},

	"dinhhuy258/git.nvim", -- For git blame & browse

	-- prettier
	"jose-elias-alvarez/typescript.nvim",

	-- syntax highlighting for python
	-- use 'sheerun/vim-polyglot'
	"vim-python/python-syntax",
	-- use{  'wookayin/semshi', ft="python", config="vim.cmd [[UpdateRemotePlugins]]" }
	-- use{  'numirias/semshi', ft="python", config="vim.cmd [[UpdateRemotePlugins]]" }

	-- Duplicate
	"smjonas/duplicate.nvim",

	-- Symbol outlines
	{ "simrat39/symbols-outline.nvim" },

	-- Dap
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	"theHamsta/nvim-dap-virtual-text",

	-- Float term
	"voldikss/vim-floaterm",

	-- Quickscope
	-- "unblevable/quick-scope",

	-- Hop
	{
		"phaazon/hop.nvim",
		branch = "v2",
	},

	-- undotree
	"mbbill/undotree",

	-- which key

	-- Better buffer
	"matbme/JABS.nvim",

	-- Harpoon jump to file with anchor
	"ThePrimeagen/harpoon",

	-- Dashboard and session manager

	-- Tmux & neovim navigator
	"alexghergh/nvim-tmux-navigation",

	-- better notify
	"rcarriga/nvim-notify",

	-- yarp
	"roxma/vim-hug-neovim-rpc",
	{
		"roxma/nvim-yarp",
		config = function() end,
		event = "VeryLazy",
	},

	-- better cmdline
}
