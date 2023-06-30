local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local plugins = {
	-- Styling
	"rebelot/kanagawa.nvim",
	"xiyaowong/transparent.nvim",

	"nvim-lualine/lualine.nvim", -- Statusline
	"nvim-lua/plenary.nvim", -- Common utilities
	"onsails/lspkind-nvim", -- vscode-like pictograms
	"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
	"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
	"hrsh7th/nvim-cmp", -- Completion
	"neovim/nvim-lspconfig", -- LSP
	"jose-elias-alvarez/null-ls.nvim", -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jay-babu/mason-nvim-dap.nvim",

	"glepnir/lspsaga.nvim", -- LSP UIs

	-- Snippets
	{ "L3MON4D3/LuaSnip" },
	"rafamadriz/friendly-snippets",
	{ "saadparwaiz1/cmp_luasnip" },

	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
	"kyazdani42/nvim-web-devicons", -- File icons
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	"nvim-telescope/telescope-file-browser.nvim",
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	"norcalli/nvim-colorizer.lua",
	"folke/zen-mode.nvim",
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
	},
	"akinsho/nvim-bufferline.lua",
	"github/copilot.vim",

	"lewis6991/gitsigns.nvim",
	"dinhhuy258/git.nvim", -- For git blame & browse

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	"tpope/vim-fugitive",
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "f-person/git-blame.nvim" },
	{ "TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim" },
	{
		"akinsho/git-conflict.nvim",
		config = function()
			require("git-conflict").setup()
		end,
	},

	-- debug print
	{ "PatschD/zippy.nvim", keys = "clg" },

	-- prettier
	"jose-elias-alvarez/typescript.nvim",

	-- syntax highlighting for python
	-- use 'sheerun/vim-polyglot'
	"vim-python/python-syntax",
	-- use{  'wookayin/semshi', ft="python", config="vim.cmd [[UpdateRemotePlugins]]" }
	-- use{  'numirias/semshi', ft="python", config="vim.cmd [[UpdateRemotePlugins]]" }

	-- better TODO list
	{ "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" },

	-- Trouble for better list
	"folke/trouble.nvim",

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

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- undotree
	"mbbill/undotree",

	-- which key
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	-- Better buffer
	"matbme/JABS.nvim",

	-- Harpoon jump to file with anchor
	"ThePrimeagen/harpoon",

	-- Dashboard and session manager
	"Shatur/neovim-session-manager",
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},

	-- Tmux & neovim navigator
	"alexghergh/nvim-tmux-navigation",
}

local opts = {}

require("lazy").setup(plugins, opts)
