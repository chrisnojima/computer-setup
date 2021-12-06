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
-- nerdtree
map('', '<leader>nf', ':NERDTreeFind<cr>', {noremap = true})
map('', '<leader>nn', ':NERDTreeToggle<cr>', {noremap = true})
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

-- fuzzy search
map('n', '<c-p>',  ':Files<CR>', {noremap = true})
map('n', '<c-l>',  ':Buffers<CR>', {noremap = true})

-- map('i', '<c-c>',  '<Esc>', {noremap = true})

map('n', '/',  '/\\v', {noremap = true})
map('c', '%s/',  '%s/\\v', {noremap = true})

-- TODO
vim.cmd [[
    " Key maps
    :command! Q :qa!
    map q: <Nop>
    nnoremap Q <nop>

" do match 1+1<C-A> =2!
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
:command! -nargs=1 S Rg -g '*.tsx' -g '*.d.ts' <q-args> ..
map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr>     " And load session with F3
" move lines up/down in visual using JK from wincent
function! s:Visual()
  return visualmode() == 'V'
endfunction

function! s:Move(address, should_move)
  if s:Visual() && a:should_move
    execute "'<,'>move " . a:address
    " call feedkeys('gv=', 'n') " dont intent as its too slow
  endif
  call feedkeys('gv', 'n')
endfunction

function! Move_up() abort range
  let l:count=v:count ? -v:count : -1
  let l:max=(a:firstline - 1) * -1
  let l:movement=max([l:count, l:max])
  let l:address="'<" . (l:movement - 1)
  let l:should_move=l:movement < 0
  call s:Move(l:address, l:should_move)
endfunction

function! Move_down() abort range
  let l:count=v:count ? v:count : 1
  let l:max=line('$') - a:lastline
  let l:movement=min([l:count, l:max])
  let l:address="'>+" . l:movement
  let l:should_move=l:movement > 0
  call s:Move(l:address, l:should_move)
endfunction

xnoremap <silent> K :call Move_up()<CR>
xnoremap <silent> J :call Move_down()<CR>

]]
