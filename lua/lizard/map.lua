local keymap = vim.keymap

keymap.set("n", "x", '"+x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')
keymap.set("i", "<C-H>", "<C-w>") -- Delete whole word in insert mode

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", "te", ":tabedit")
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
-- Move window
keymap.set("n", "<Space>", "<C-w>w")

-- Resize window
keymap.set("n", "<C-left>", "<C-w><")
keymap.set("n", "<C-right>", "<C-w>>")
keymap.set("n", "<C-up>", "<C-w>+")
keymap.set("n", "<C-down>", "<C-w>-")

-- Move lines arround
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- Toggle comment
-- keymap.set("n", "<leader>/", "gcc")

-- Toggle window
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")

-- Move view
keymap.set("n", "<C-e>", "5<C-e>")
keymap.set("n", "<C-y>", "5<C-y>")

-- copy selection and paste it
keymap.set("v", "<C-j>", "yjp")
keymap.set("v", "<C-k>", "ykp")

-- close tab
keymap.set("n", "<Space>tc", ":tabc<Return>")

-- terminal
keymap.set("t", "<C-t><ESC>", "<C-\\><C-n>")

-- duplicate block
keymap.set("v", "<C-S-j>", ":t'><Return>", { noremap = true, silent = true })

keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- buffer operatoin
keymap.set("n", "<leader>bt", "<C-6>", { desc = "[B]uffer [T]oggle" })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
