set nocompatible              
filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'adrian.vim'
Plugin 'matchit.zip'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/rainbow_parentheses.vim.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'Lokaltog/vim-easymotion.git'
Plugin 'maksimr/vim-jsbeautify.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'myusuf3/numbers.vim'
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

colorscheme adrian
if has("gui_macvim")
  colorscheme solarized
endif

if has("mac") || has("macunix")
 set gfn=Menlo:h14
 set shell=/bin/bash
elseif has("win16") || has("win32")
 set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif has("linux")
 set gfn=Monospace\ 10
 set shell=/bin/bash
endif

hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Key maps
let mapleader = ","
let g:mapleader = ","
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
map <leader>w :w<cr>
map <leader>cd :cd %:p:h<CR>

"Plugin stuff
let NERDTreeMinimalUI=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting=1
au BufNewfile,BufRead *.less set ft=less.css
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
