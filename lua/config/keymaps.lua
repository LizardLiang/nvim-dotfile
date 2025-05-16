-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local discipline = require("craftzdog.discipline")
-- discipline.cowboy()

local Util = require("lazyvim/util")
local map = Util.safe_keymap_set

local opts = { noremap = true, silent = true }

-- Prevent paste to override the clipboard buffer
map({ "v" }, "p", '"_dp')

-- Prevent useless help
map({ "n" }, "<F1>", "<nop>")

-- Toggle between two buffers
map({ "n" }, "<leader>bt", "<C-6>", { desc = "[B]uffer [T]oggle" })

-- Move cursor
map({ "n" }, "<s-g>", "<s-g>zz")
map({ "n" }, "<C-u>", "<C-u>zz")
map({ "n" }, "<C-d>", "<C-d>zz")
map({ "n" }, "j", "jzz")
map({ "n" }, "k", "kzz")
map({ "n" }, "[f", "[fzz")
map({ "n" }, "]f", "]fzz")

-- Increment/decrement window size
map({ "n" }, "+", "<C-a>")
map({ "n" }, "-", "<C-x>")

-- Delete a word backward
map({ "n" }, "dw", "vb_d")

-- Select all
map({ "n" }, "vae", "gg<S-v>G")

-- Jumplist
map({ "n" }, "<C-m>", "<C-i>", opts)

-- New tab
map({ "n" }, "te", "tabedit", opts)
map({ "n" }, "<tab>", ":tabnext<Return>", opts)
map({ "n" }, "<s-tab>", ":tabpreview<Return>", opts)

-- Split window
map({ "n" }, "ss", ":split<Return>", opts)
map({ "n" }, "sv", ":vsplit<Return>", opts)

-- Move window
-- map({"n"}, "sh", "<C-w>h")
-- map({"n"}, "sj", "<C-w>j")
-- map({"n"}, "sk", "<C-w>k")
-- map({"n"}, "sl", "<C-w>l")

-- Resize window
map({ "n" }, "<C-w><left>", "<C-w><")
map({ "n" }, "<C-w><right>", "<C-w>>")
map({ "n" }, "<C-w><up>", "<C-w>+")
map({ "n" }, "<C-w><down>", "<C-w>-")

-- Diagnostics
map({ "n" }, "<C-j>", function()
  vim.diagnostic.goto_next()
end)

map({ "n" }, "<leader>mp", "<Cmd>PeekOpen<CR>", { desc = "[O]pen [M]arkdown [P]eek" })

map({ "n" }, "n", "nzzzv", { desc = "Next search result and center" })
map({ "n" }, "N", "Nzzzv", { desc = "Next search result and center" })

-- keymap.del("t", "<esc><esc>")
