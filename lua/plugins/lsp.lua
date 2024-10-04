local util = require("conform.util")
local prettier_for_gyp = vim.deepcopy(require("conform.formatters.prettier"))
util.add_formatter_args(prettier_for_gyp, { "--parser", "json" })

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "shellcheck",
        "shfmt",
        "typescript-language-server",
        "css-lsp",
        "black",
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      opts.snippet.expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end
      table.insert(opts.sources, { name = "emoji" })
      table.insert(opts.sources, 1, { name = "luasnip", group_index = 1, priority = 101 })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
        --[[
        omnisharp = {
          handlers = {
            ["textDocument/definition"] = function(...)
              return require("omnisharp_extended").handler(...)
            end,
          },
          keys = {
            {
              "gd",
              function()
                require("omnisharp_extended").lsp_definition()
              end,
              desc = "Goto Definition",
            },
          },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
        ]]
      },
      setup = {},
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      -- Formatters are automatically loaded before lazy.nvim startup
      -- Add any additional formatters here
      formatters_by_ft = {
        gyp = { "prettier_for_gyp" },
        cs = { "csharpier", "omnisharp" },
      },
      formatters = {
        prettier_for_gyp = prettier_for_gyp,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(
          opts.ensure_installed,
          { "ninja", "python", "rst", "toml", "scss", "cmake", "cpp", "css", "sql" }
        )
      end
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.filetype.add({
        extension = { mdx = "mdx" },
      })

      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
  { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true, enable = false },
}
