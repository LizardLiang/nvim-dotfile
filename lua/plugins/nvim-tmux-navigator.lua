return {
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
}
