set nocompatible              
filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'matchit.zip'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/rainbow_parentheses.vim.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'Lokaltog/vim-easymotion.git'
Plugin 'maksimr/vim-jsbeautify.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'airblade/vim-gitgutter.git'
Plugin 'Raimondi/delimitMate.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'myusuf3/numbers.vim'
Plugin 'bling/vim-airline.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'chrisnojima/nojima-vim-snippets.git'
Plugin 'moll/vim-node.git'
Plugin 'mileszs/ack.vim.git'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'tomasr/molokai.git'
call vundle#end()           
filetype plugin indent on  

set ai 
set clipboard=unnamed
set cmdheight=2
set encoding=utf8
set expandtab
set ffs=unix,dos,mac
set foldcolumn=1
set history=700
set hlsearch
set ignorecase
set incsearch 
set laststatus=2
set lazyredraw 
set lbr
set magic
set mat=2
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowb
set nu
set shiftwidth=2
set showcmd
set showmatch 
set si
set smartcase
set smarttab
set spell
set t_vb=
set tabstop=4
set textwidth=9999
set tm=500
set tw=500
set wrap 
syntax enable 

colorscheme molokai

if has("mac") || has("macunix")
 set gfn=Menlo:h24
 set shell=/bin/bash
 set guifont=Anonymous\ Pro\ for\ Powerline:h16
endif

" Key maps
let mapleader = ","
let g:mapleader = ","
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
map <leader>w :w<cr>
map <leader>cd :cd %:p:h<CR>
map <leader>o <c-w>o<cr>

"Plugin stuff
let NERDTreeMinimalUI=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting=1
au BufNewfile,BufRead *.less set ft=less.css
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:indent_guides_enable_on_vim_startup = 1
