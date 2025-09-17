return {
  {
    "TimUntersberger/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function()
      local neogit = require("neogit")

      neogit.setup({
        integrations = {
          diffview = true,
        },
      })

      -- vim.keymap.set("n", "<leader>gs", ":Neogit<CR>")
      -- vim.keymap.set("n", "<leader>gc", function()
      --   neogit.open({ "commit" })
      -- end)
    end,
  },
  {
    "dinhhuy258/git.nvim", -- For git blame & browse
    event = "BufReadPre",
    keys = { { "<leader>gp", false }, { "<leader>gd", false }, { "<leader>gD", false } },
    config = function()
      local status, git = pcall(require, "git")
      if not status then
        return
      end

      git.setup({
        keymaps = {
          -- Open blame window
          blame = "<Leader>gb",
          -- Open file/folder in git repository
          browse = "<Leader>go",
        },
      })
    end,
  },
  {
    "tpope/vim-fugitive", -- For git commands
    event = "BufRead",
    config = function()
      local map = vim.keymap.set
      map({ "n" }, "<leader>gd", "<Cmd>Gvdiff<CR>", { desc = "[G]it [D]iff" })
      map({ "n" }, "<leader>gD", "<Cmd>Gvdiffsplit<CR>", { desc = "[Git] [D]iff conflict" })
    end,
  },
  {
    "LizardLiang/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      debug_mode = true,
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

      -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghP", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
}
