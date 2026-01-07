local util = require("conform.util")
local prettier_for_gyp = vim.deepcopy(require("conform.formatters.prettier"))
util.add_formatter_args(prettier_for_gyp, { "--parser", "json" })

local function ts_disable(_, bufnr)
  return vim.api.nvim_buf_line_count(bufnr) > 5000
end

return {
  {
    "seblyng/roslyn.nvim",
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
      vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
      vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
      vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
      vim.keymap.set("i", "<c-k", vim.lsp.buf.signature_help, { desc = "Signature Help" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
      vim.keymap.set("n", "<leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh & Display Codelens" })
      vim.keymap.set("n", "<leader>cR", function()
        Snacks.rename.rename_file()
      end, { desc = "Rename File" })
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set("n", "<leader>cA", LazyVim.lsp.action.source, { desc = "Source Action" })
      vim.keymap.set("n", "]]", function()
        Snacks.words.jump(vim.v.count1)
      end, { desc = "Next Reference" })
      vim.keymap.set("n", "[[", function()
        Snacks.words.jump(-vim.v.count1)
      end, { desc = "Prev Reference" })
      vim.keymap.set("n", "<a-n>", function()
        Snacks.words.jump(vim.v.count1, true)
      end, { desc = "Next Reference" })
      vim.keymap.set("n", "<a-p>", function()
        Snacks.words.jump(-vim.v.count1, true)
      end, { desc = "Prev Reference" })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "shellcheck",
        "shfmt",
        "typescript-language-server",
        "css-lsp",
        "black",
      })
      opts.registries = { "github:mason-org/mason-registry", "github:Crashdummyy/mason-registry" }
    end,
  },
  { "mason-org/mason-lspconfig.nvim" },
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
        cs = { "csharpier" },
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
    keys = {
      { "[c", false },
      { "]c", false },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    keys = {
      { "[c", false },
      { "]c", false },
    },
    opts = function(_, opts)
      vim.filetype.add({
        extension = { mdx = "mdx" },
      })

      vim.treesitter.language.register("markdown", "mdx")

      if type(opts.ensure_installed) == "table" then
        vim.list_extend(
          opts.ensure_installed,
          { "python", "rst", "toml", "scss", "cmake", "cpp", "css", "sql", "tsx", "jsx", "javascript" }
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
  },
}
