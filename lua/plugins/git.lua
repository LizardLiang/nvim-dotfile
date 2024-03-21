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

      vim.keymap.set("n", "<leader>gs", ":Neogit<CR>")
      vim.keymap.set("n", "<leader>gc", function()
        neogit.open({ "commit" })
      end)
    end,
  },
  {
    "dinhhuy258/git.nvim", -- For git blame & browse
    event = "BufReadPre",
    keys = { { "<leader>gp", false } },
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
      local status, fugitive = pcall(require, "fugitive")
    end,
  },
  { "f-person/git-blame.nvim", event = "VeryLazy" },
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
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
