return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	event = "BufRead",
	config = function()
		local status, ts = pcall(require, "nvim-treesitter.configs")
		if not status then
			return
		end

		ts.setup({})

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

		-- [[ Configure Treesitter ]]
		-- See `:help nvim-treesitter`
		require("nvim-treesitter.configs").setup({
			-- Add languages to be installed here that you want installed for treesitter
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<c-backspace>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
				highlight = {
					enable = true,
					disable = {},
				},
				indent = {
					enable = true,
					disable = {},
				},
				ensure_installed = {
					"markdown",
					"markdown_inline",
					"tsx",
					"toml",
					"json",
					"yaml",
					"css",
					"html",
					"lua",
					"c",
					"cpp",
					"python",
					"typescript",
				},
				autotag = {
					enable = true,
				},
				disable = { "cs" },
			},
		})
	end,
}
