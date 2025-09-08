local util = require("conform.util")
local prettier_for_gyp = vim.deepcopy(require("conform.formatters.prettier"))
util.add_formatter_args(prettier_for_gyp, { "--parser", "json" })

local function ts_disable(_, bufnr)
  return vim.api.nvim_buf_line_count(bufnr) > 5000
end

return {
  {
    "williamboman/mason.nvim",
    version = "^1.0.0",
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
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
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
      inlay_hints = {
        enabled = true,
        exclude = { "vue", "cpp", "c", "typescript", "typescriptreact" }, -- filetypes for which you don't want to enable inlay hints
      },
      servers = {
        pyright = {},
      },
      setup = {
        -- clangd = function(_, opts)
        --   opts.capabilities.offsetEncoding = { "utf-8" }
        -- end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      -- Formatters are automatically loaded before lazy.nvim startup
      -- Add any additional formatters here
      formatters_by_ft = {
        gyp = { "prettier_for_gyp" },
        cs = { "omnisharp" },
        typescriptreact = { "prettierd" },
        javascriptreact = { "prettierd" },
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
      opts.highlight = {
        enable = true,
        disable = function(lang, bufnr)
          return lang == "cmake" or ts_disable(lang, bufnr)
        end,
        additional_vim_regex_highlighting = { "latex" },
      }
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.filetype.add({
        extension = { mdx = "mdx" },
      })

      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
