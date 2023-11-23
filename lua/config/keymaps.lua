-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local discipline = require("craftzdog.discipline")
-- discipline.cowboy()

local Util = require("lazyvim/util")
local map = Util.safe_keymap_set

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

map({ "n" }, "<leader>bt", "<C-6>", { desc = "[B]uffer [T]oggle" })

-- Increment/decrement window size
map({ "n" }, "+", "<C-a>")
map({ "n" }, "-", "<C-x>")

-- Delete a word backward
map({ "n" }, "dw", "vb_d")

-- Select all
map({ "n" }, "<C-a>", "gg<S-v>G")

-- Jumplist
map({ "n" }, "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", "tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabpreview<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)
