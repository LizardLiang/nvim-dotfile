local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')
keymap.set('i', '<C-H>', '<C-w>') -- Delete whole word in insert mode

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Move lines arround
keymap.set('n', '<A-k>', ":m .-2<CR>==")
keymap.set('n', '<A-j>', ":m .+1<CR>==")
keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")
keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")

-- Toggle comment
keymap.set('n', '<C-/>', 'gcc')

-- Toggle window
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-l>', '<C-w>l')

-- copy selection and paste it 
keymap.set('v', '<C-j>', 'yjp')
keymap.set('v', '<C-k>', 'ykp')

-- close tab
keymap.set('n', '<Space>tc', ':tabc<Return>')

-- terminal
keymap.set('t', '<Esc>', '<C-\\><C-n>')
