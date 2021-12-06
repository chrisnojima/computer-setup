local map = vim.api.nvim_set_keymap

vim.g.mapleader = ','

map('n', 'n', 'nzz', {noremap = true})
map('n', 'N', 'Nzz', {noremap = true})
map('n', 'K', '<nop>', {noremap = true})
map('n', ':cn', ':cn<CR>zz', {noremap = true})


map('', '<leader>cd', ':cd %:p:h<CR>', {noremap = true})
map('', '<leader>n', '<c-w>w', {noremap = true})
map('', '<leader>nf', ':NERDTreeFind<cr>', {noremap = true})
map('', '<leader>nn', ':NERDTreeToggle<cr>', {noremap = true})
map('', '<leader>o', '<c-w>o<cr>', {noremap = true})
map('', '<leader>t', ':tabc<cr>', {noremap = true})
