local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter' --- show git changes in the gutter
Plug 'luochen1990/rainbow' ---  better rainbow
Plug 'nathanaelkane/vim-indent-guides' --- visually shows indents
Plug 'itchyny/lightline.vim' --- status bar / tabs
Plug 'roman/golden-ratio' --- keep window sizes better
Plug('vim-scripts/matchit.zip', { ['for'] = 'javascript' }) --- smarter %
Plug 'justinmk/vim-sneak' ---  better movement

--- Search
Plug 'jremmen/vim-ripgrep' ---  better search
Plug('junegunn/fzf', {dir= '~/.fzf', ['do']= './install --all' })
Plug 'junegunn/fzf.vim' --- fuzzy finder

--- Files
Plug('scrooloose/nerdtree', {on = {'NERDTreeToggle', 'NERDTreeFind'} }) --- file explorer
Plug('Xuyuanp/nerdtree-git-plugin', {on = {'NERDTreeToggle', 'NERDTreeFind'} })  ---  git aware nerdtree

--- Utility
Plug 'tpope/vim-abolish' --- smarter substitute and abbreviate
Plug 'tpope/vim-fugitive' --- git integration
Plug 'tpope/vim-repeat' --- repeat commands better
Plug 'tpope/vim-surround' --- surround things better
Plug 'tpope/vim-unimpaired' --- toggle mappings quicker
Plug 'scrooloose/nerdcommenter' --- better comments
Plug 'mhartington/oceanic-next' ---  colors
Plug 'sheerun/vim-polyglot' --- various language support (js etc)
Plug 'sjl/gundo.vim' --- viz undo tree
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug 'Raimondi/delimitMate' --- closes brackets

vim.call('plug#end')

vim.cmd 'source ~/.config/nvim/lua/plug-todo.vim'
