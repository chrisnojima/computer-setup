local map = vim.api.nvim_set_keymap

vim.g.mapleader = ','

-- center search
map('n', 'n', 'nzz', {noremap = true})
map('n', 'N', 'Nzz', {noremap = true})
-- map('n', 'K', '<nop>', {noremap = true})
-- center opening results
map('n', ':cn', ':cn<CR>zz', {noremap = true})


-- change dir
map('', '<leader>cd', ':cd %:p:h<CR>', {noremap = true})
-- map('', '<leader>n', '<c-w>w', {noremap = true})
-- close other
map('', '<leader>o', '<c-w>o<cr>', {noremap = true})
-- close current tab
map('', '<leader>t', ':tabc<cr>', {noremap = true})

-- write
map('', '<leader>w',  ':w<cr>', {noremap = true})
-- close other tabs
map('', '<leader>to',  ':tabo<cr>', {noremap = true})
-- window movement
map('', '<leader>h',  ':wincmd h<CR>', {noremap = true})
map('', '<leader>j',  ':wincmd j<CR>', {noremap = true})
map('', '<leader>k',  ':wincmd k<CR>', {noremap = true})
map('', '<leader>l',  ':wincmd l<CR>', {noremap = true})
map('', '<leader>q',  ':normal @q<CR>', {noremap = true})

-- telescope
vim.api.nvim_set_keymap("n", "<C-p>", "<CMD>Telescope git_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<CMD>Telescope live_grep<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<C-m>", "<CMD>Telescope oldfiles<CR>", { noremap = true })

map('n', '/',  '/\\v', {noremap = true})
map('c', '%s/',  '%s/\\v', {noremap = true})

-- quick write sessions with f2/f3
map('', '<F2>',  ':mksession! ~/.vim_session<CR>', {noremap = true})
map('', '<F3>',  ':source ~/.vim_session<CR>', {noremap = true})

-- Commands aren't easy to do yet?
vim.cmd [[
    " Key maps
    :command! Q :qa!
    :command! -nargs=1 S Rg -g '*.tsx' -g '*.d.ts' <q-args> ..
]]
