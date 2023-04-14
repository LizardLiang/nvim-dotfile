require('diffview').setup({})

vim.keymap.set('n', '<leader>dv', ':DiffviewOpen<CR>', {noremap = true, silent = true})

