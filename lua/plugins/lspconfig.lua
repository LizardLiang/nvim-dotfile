local utils = require("constants.omnisharp")
local cssls = require("constants.cssls")
-- LSP
return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	config = function()
		--vim.lsp.set_log_level("debug")
		local keymap = vim.keymap

		local status, nvim_lsp = pcall(require, "lspconfig")
		if not status then
			return
		end

		local protocol = require("vim.lsp.protocol")

		local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
		local enable_format_on_save = function(_, bufnr)
			vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup_format,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		local on_attach = function(client, bufnr)
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			--Enable completion triggered by <c-x><c-o>
			--local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
			--buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

			-- Mappings.
			local opts = { noremap = true, silent = true }

			-- See `:help vim.lsp.*` for documentation on any of the below functions
			buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
			--buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
			buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			--buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
		end

		protocol.CompletionItemKind = {
			"", -- Text
			"", -- Method
			"", -- Function
			"", -- Constructor
			"", -- Field
			"", -- Variable
			"", -- Class
			"ﰮ", -- Interface
			"", -- Module
			"", -- Property
			"", -- Unit
			"", -- Value
			"", -- Enum
			"", -- Keyword
			"﬌", -- Snippet
			"", -- Color
			"", -- File
			"", -- Reference
			"", -- Folder
			"", -- EnumMember
			"", -- Constant
			"", -- Struct
			"", -- Event
			"ﬦ", -- Operator
			"", -- TypeParameter
		}

		-- Set up completion using nvim_cmp with LSP source
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		nvim_lsp.flow.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		require("typescript-tools").setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
			},
		})

		-- nvim_lsp.tsserver.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- })

		nvim_lsp.luau_lsp.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
		})

		nvim_lsp.cssls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		nvim_lsp.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- nvim_lsp.csharp_ls.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- })

		local pid = vim.fn.getpid()
		local omnisharp_bin =
			"C:\\Users\\lizard.liang.WATCHSOFT\\AppData\\Local\\nvim-data\\mason\\packages\\omnisharp\\libexec\\OmniSharp.exe"

		nvim_lsp.omnisharp.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			-- cmd = {
			-- 	"dotnet",
			-- 	utils.getPath(),
			-- },
			cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
			handlers = {
				["textDocument/definition"] = require("omnisharp_extended").handler,
			},
			-- Enables support for reading code style, naming convention and analyzer
			-- settings from .editorconfig.
			enable_editorconfig_support = true,
			-- If true, MSBuild project system will only load projects for files that
			-- were opened in the editor. This setting is useful for big C# codebases
			-- and allows for faster initialization of code navigation features only
			-- for projects that are relevant to code that is being edited. With this
			-- setting enabled OmniSharp may load fewer projects and may thus display
			-- incomplete reference lists for symbols.
			enable_ms_build_load_projects_on_demand = false,
			-- Enables support for roslyn analyzers, code fixes and rulesets.
			enable_roslyn_analyzers = false,
			-- Specifies whether 'using' directives should be grouped and sorted during
			-- document formatting.
			organize_imports_on_format = true,
			-- Enables support for showing unimported types and unimported extension
			-- methods in completion lists. When committed, the appropriate using
			-- directive will be added at the top of the current file. This option can
			-- have a negative impact on initial completion responsiveness,
			-- particularly for the first few completion sessions after opening a
			-- solution.
			enable_import_completion = true,
			-- Specifies whether to include preview versions of the .NET SDK when
			-- determining which version to use for project loading.
			sdk_include_prereleases = true,
			-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
			-- true
			analyze_open_documents_only = false,
		})

		local clangd_cap = require("cmp_nvim_lsp").default_capabilities()
		clangd_cap.offsetEncoding = { "utf-16" }

		nvim_lsp.clangd.setup({
			capabilities = clangd_cap,
			rootPattern = { "compile_commands.json", "compile_flags.txt", ".git" },
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
				"--all-scopes-completion",
				"--completion-style=detailed",
			},
		})

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 4, prefix = "●" },
			severity_sort = true,
		})

		-- Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
			},
			update_in_insert = true,
			float = {
				source = "always", -- Or "if_many"
			},
		})

		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
		keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

		-- See `:help K` for why this keymap
		keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
		keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

		-- Lesser used LSP functionality
		-- keymap.set("n", 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
		keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd Folder" })
		keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove Folder" })
		keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { desc = "[W]orkspace [L]ist Folders" })
	end,
}
