return {
  {
    -- Float term
    "voldikss/vim-floaterm",
    config = function()
      local keymap = vim.keymap

      keymap.set("n", "<leader>tn", ":FloatermNew<CR>")
      keymap.set("n", "<leader>tt", ":FloatermToggle<CR>")
      keymap.set("n", "<leader>tp", ":FloatermPrev<CR>")
      keymap.set("n", "<leader>tn", ":FloatermNext<CR>")
      keymap.set("n", "<leader>tlg", ":FloatermNew --height=0.9 --width=0.8 lazygit<CR>")
    end,
  },
  {
    -- Tmux & neovim navigator
    "alexghergh/nvim-tmux-navigation",
    keys = { "<C-h>", "<C-j>", "<C-k>", "<C-l>", "<C-\\>", "<C-Space>" },
    config = function()
      local nav = require("nvim-tmux-navigation")

      nav.setup({
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        },
      })
    end,
  },
}
