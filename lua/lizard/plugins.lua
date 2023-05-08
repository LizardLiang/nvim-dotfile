local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use("wbthomason/packer.nvim")
  -- use {
  --   'svrana/neosolarized.nvim',
  --   requires = { 'tjdevries/colorbuddy.nvim' }
  -- }

  -- Styling
  use("rebelot/kanagawa.nvim")
  use("xiyaowong/transparent.nvim")

  use("nvim-lualine/lualine.nvim")      -- Statusline
  use("nvim-lua/plenary.nvim")          -- Common utilities
  use("onsails/lspkind-nvim")           -- vscode-like pictograms
  use("hrsh7th/cmp-buffer")             -- nvim-cmp source for buffer words
  use("hrsh7th/cmp-nvim-lsp")           -- nvim-cmp source for neovim's built-in LSP
  use("hrsh7th/nvim-cmp")               -- Completion
  use("neovim/nvim-lspconfig")          -- LSP
  use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("jay-babu/mason-nvim-dap.nvim")

  use("glepnir/lspsaga.nvim") -- LSP UIs

  -- Snippets
  use({ "L3MON4D3/LuaSnip" })
  use("rafamadriz/friendly-snippets")
  use({ "saadparwaiz1/cmp_luasnip" })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })
  use("kyazdani42/nvim-web-devicons") -- File icons
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use({
    "numToStr/Comment.nvim",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    }
  })
  use("norcalli/nvim-colorizer.lua")
  use("folke/zen-mode.nvim")
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  use("akinsho/nvim-bufferline.lua")
  use("github/copilot.vim")

  use("lewis6991/gitsigns.nvim")
  use("dinhhuy258/git.nvim") -- For git blame & browse

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  })

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  })

  use("tpope/vim-fugitive")
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
  use({ "f-person/git-blame.nvim" })
  use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
  use({
    "akinsho/git-conflict.nvim",
    tag = "*",
    config = function()
      require("git-conflict").setup()
    end,
  })

  -- debug print
  use("PatschD/zippy.nvim")

  -- prettier
  use("jose-elias-alvarez/typescript.nvim")

  -- syntax highlighting for python
  -- use 'sheerun/vim-polyglot'
  use("vim-python/python-syntax")
  -- use{  'wookayin/semshi', ft="python", config="vim.cmd [[UpdateRemotePlugins]]" }
  -- use{  'numirias/semshi', ft="python", config="vim.cmd [[UpdateRemotePlugins]]" }

  -- better TODO list
  use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

  -- Trouble for better list
  use("folke/trouble.nvim")

  -- Duplicate
  use("smjonas/duplicate.nvim")

  -- Multi cursor
  -- use 'mg979/vim-visual-multi'
  -- Symbol outlines
  use({ "simrat39/symbols-outline.nvim" })

  -- Dap
  use("mfussenegger/nvim-dap")
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
  use("theHamsta/nvim-dap-virtual-text")

  -- Float term
  use("voldikss/vim-floaterm")

  -- Quickscope
  use("unblevable/quick-scope")

  -- Hop
  use({
    "phaazon/hop.nvim",
    branch = "v2",
  })

  -- undotree
  use("mbbill/undotree")

  -- which key
  use({
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  })
end)
