require("lizard.base")
require("lizard.highlights")
require("lizard.plugins")
require("lizard.map")

local has = vim.fn.has
local is_win = has("win32")
local is_wsl = has("wsl")

if is_win == 1 then
	require("lizard.windows")
end

if is_wsl == 1 then
	require("lizard.windows")
	require("lizard.wsl")
end

-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
